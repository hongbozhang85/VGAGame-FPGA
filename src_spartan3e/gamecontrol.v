/* hongbo
	the main part of function 3. 
	this is a state machine. Mealey machine.
	Apr 23
		There are four states: 
			Initial, Move, Scramble, Win
			Ini: no arrow, just show the pic.
			Mov: move the cursor. 
		There are 6 inputs relevant to state transfer
			mode, reset
			right, left, up, down ( these four will not result in state transfer, but affect the output, Mealey machine)
		There are 3 outputs
			addr, inv, isarrow
			addr: the address of pixels in picture to shown on screen
			inv: whether use inverse color (used in Win state)
			isarrow: whether there is an arrow in this location, to display the arrow
		In the this version, Scr state is not finished, condition hasn't been determined and arrow is displayed as inverse color
	Apr 24
		Scramble mode, only for left and right.
		up and down hasn't implemented.
		condition for Win still need further improvement.
		arrow hasn't been displayed.
	Apr 24 midnight
		everything is done, except arrow
		need to further optimization. 45 mins to compile on my old laptop
*/

`include "outputAddr.v"
`include "upImgScr.v"
`include "downImgScr.v"

module gamecontrol ( 
	input wire vgaclk, 
	input wire right,
	input wire left,
	input wire up,
	input wire down,
	input wire reset,
	input wire [3:0] pixelH,
	input wire [3:0] pixelV, 
	input wire mode, 
	input wire checkwin,
	output reg [7:0] addr, 
	output reg inv, 
	output reg isarrow,
	output reg movearrow
);
	
	// encoding four states, using grey code
	parameter Ini = 2'b00;
	parameter Mov = 2'b01;
	parameter Scr = 2'b11;
	parameter Win = 2'b10;
	reg [1:0] state = Ini, Snext;
	reg [3:0] arrowH = 4'd0, arrowV = 4'd0; // arrowH, arrowV: counter of arrow in Move.
	reg [23:0] invcount = 23'd0;
	parameter NORMAL = 2048'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0dfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0bfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a09f9e9d9c9b9a999897969594939291908f8e8d8c8b8a898887868584838281807f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261605f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241403f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221201f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;
	reg [2047:0] imgScr = NORMAL; // the image in scramle
	wire condition;
	
	assign condition = ( imgScr == NORMAL ) && (checkwin);
	
	
	// (1) counter, arrowH arrowV, the location of arrow
	always @(posedge vgaclk) begin
		if ( reset ) begin
			arrowH <= 4'd0;
			arrowV <= 4'd0;
		end
		else if ( state == Mov ) begin
			if ( right ) arrowH <= ((arrowH == 4'd15) ? (4'd0) : arrowH + 4'd1);
			if ( left  ) arrowH <= ((arrowH == 4'd0) ? (4'd15) : arrowH - 4'd1);
			if ( up    ) arrowV <= ((arrowV == 4'd0) ? (4'd15) : arrowV - 4'd1);
			if ( down  ) arrowV <= ((arrowV == 4'd15) ? (4'd0) : arrowV + 4'd1);
		end
		else begin
			arrowH <= arrowH;
			arrowV <= arrowV;
		end			
	end
	
	// (2) imgScr
	always @(posedge vgaclk) begin // for debug purpose
		if ( reset ) imgScr <= NORMAL;
		else if ( state == Scr ) 
			if ( left  ) begin
				case (arrowV)
				4'h0:    imgScr[127:0] <= { imgScr[7:0], imgScr[127:8] };
				4'h1:    imgScr[255:128] <= { imgScr[135:128], imgScr[255:136] };
				4'h2:    imgScr[383:256] <= { imgScr[263:256], imgScr[383:264] };
				4'h3:    imgScr[511:384] <= { imgScr[391:384], imgScr[511:392] };
				4'h4:    imgScr[639:512] <= { imgScr[519:512], imgScr[639:520] };
				4'h5:    imgScr[767:640] <= { imgScr[647:640], imgScr[767:648] };
				4'h6:    imgScr[895:768] <= { imgScr[775:768], imgScr[895:776] };
				4'h7:    imgScr[1023:896] <= { imgScr[903:896], imgScr[1023:904] };
				4'h8:    imgScr[1151:1024] <= { imgScr[1031:1024], imgScr[1151:1032] };
				4'h9:    imgScr[1279:1152] <= { imgScr[1159:1152], imgScr[1279:1160] };
				4'ha:    imgScr[1407:1280] <= { imgScr[1287:1280], imgScr[1407:1288] };
				4'hb:    imgScr[1535:1408] <= { imgScr[1415:1408], imgScr[1535:1416] };
				4'hc:    imgScr[1663:1536] <= { imgScr[1543:1536], imgScr[1663:1544] };
				4'hd:    imgScr[1791:1664] <= { imgScr[1671:1664], imgScr[1791:1672] };
				4'he:    imgScr[1919:1792] <= { imgScr[1799:1792], imgScr[1919:1800] };
				4'hf:    imgScr[2047:1920] <= { imgScr[1927:1920], imgScr[2047:1928] };
				endcase
			end
			else if ( right ) begin
				case (arrowV)
				4'h0:    imgScr[127:0] <= { imgScr[119:0], imgScr[127:120] };
				4'h1:    imgScr[255:128] <= { imgScr[247:128], imgScr[255:248] };
				4'h2:    imgScr[383:256] <= { imgScr[375:256], imgScr[383:376] };
				4'h3:    imgScr[511:384] <= { imgScr[503:384], imgScr[511:504] };
				4'h4:    imgScr[639:512] <= { imgScr[631:512], imgScr[639:632] };
				4'h5:    imgScr[767:640] <= { imgScr[759:640], imgScr[767:760] };
				4'h6:    imgScr[895:768] <= { imgScr[887:768], imgScr[895:888] };
				4'h7:    imgScr[1023:896] <= { imgScr[1015:896], imgScr[1023:1016] };
				4'h8:    imgScr[1151:1024] <= { imgScr[1143:1024], imgScr[1151:1144] };
				4'h9:    imgScr[1279:1152] <= { imgScr[1271:1152], imgScr[1279:1272] };
				4'ha:    imgScr[1407:1280] <= { imgScr[1399:1280], imgScr[1407:1400] };
				4'hb:    imgScr[1535:1408] <= { imgScr[1527:1408], imgScr[1535:1528] };
				4'hc:    imgScr[1663:1536] <= { imgScr[1655:1536], imgScr[1663:1656] };
				4'hd:    imgScr[1791:1664] <= { imgScr[1783:1664], imgScr[1791:1784] };
				4'he:    imgScr[1919:1792] <= { imgScr[1911:1792], imgScr[1919:1912] };
				4'hf:    imgScr[2047:1920] <= { imgScr[2039:1920], imgScr[2047:2040] };
				endcase
			end
			else if ( down ) begin  //here we got reverse,cause the actual file are reversed
				`upImgScr
			end
			else if ( up ) begin
				`downImgScr
			end
	end
	
	// (3) counter, invcount, blink counter
	always @(posedge vgaclk) begin
		if (reset) invcount <= 23'd0;
		else if ( state == Win )
			invcount <= invcount + 23'd1; 
		else
			invcount <= invcount;
	end
	
	// next state combinational logic
	always @(*) begin
		case (state)
			Ini: 	Snext = Mov;
			Mov: 	if ( mode ) Snext = Scr;
					else Snext = Mov;
			Scr:	if ( condition ) Snext = Win;
					else if ( mode ) Snext = Scr;
					else Snext = Mov;
			Win:	Snext = Win;
			default: Snext = Ini;
		endcase
	end
	
	// state memory
	always @(posedge vgaclk) begin
	if ( reset )
		state <= Ini;
	else
		state <= Snext;
	end
	
	// output logic
	always @(*) begin
		case (state)
			Ini:
				begin
					addr = {pixelV, pixelH};
					inv = 1'b0;
					isarrow = 1'b0;
					movearrow = 1'b0;					
				end
			Mov:
				begin
					inv = 1'b0;
					if ( (arrowH == pixelH) && (arrowV == pixelV) )
						isarrow = 1'b1;
					else 
						isarrow = 1'b0;
					if ( up || down || left || right ) movearrow = 1'b1; 
					else movearrow = 1'b0;		
					`outputaddr
				end
			Scr:
				begin
					inv = 1'b0; 
					if ( (arrowH == pixelH) && (arrowV == pixelV) )
						isarrow = 1'b1;
					else 
						isarrow = 1'b0;	
					movearrow = 1'b0;						
					//addr <= imgScr[ ({pixelV,pixelH}<<3+2048'd7) : ({pixelV,pixelH}<<3)]; 
					`outputaddr
				end
			Win:
				begin
					addr = {pixelV, pixelH};
					isarrow = 1'b0;
					inv = ( invcount < {22{1'b1}} ) ? 1'b0 : 1'b1;
					movearrow = 1'b0;					
				end
			default:
				begin
					addr = {pixelV, pixelH};
					inv = 1'b0;
					isarrow = 1'b0;
					movearrow = 1'b0;
				end
		endcase
	end

endmodule