module vgacontroller #(parameter WIDTH = 10)(
	input wire reset,
	input wire vgaclk,
	output reg pixelEN,
	output reg HS,
	output reg VS,
	output reg [9:0] addrH,
	output reg [9:0] addrV
);
	
	reg [9:0] countH = 10'b0;  
	reg [9:0] countV = 10'b0;  

	always @ (posedge vgaclk) 
	begin
		if (reset)
		begin
			countH <= 10'd0;
			countV <= 10'd0;
		end
		else
		begin
			case (countH)
				10'd799: // end of horizontal
					begin
						countH <= 10'd0;
						case (countV)
							10'd524: countV <= 0; // end of vertical
							default: countV <= countV + 10'd1;
						endcase
					end
				default: countH <= countH + 10'd1;
			endcase
		end 
	end  
	
	
	always @ (*) begin
		HS = (countH < 10'd96) ? 1'b0: 1'b1; //Set the HS signal according to H_counter 
		VS = (countV < 10'd2) ? 1'b0 : 1'b1; //Set the VS signal according to V_counter 
		pixelEN = ((countH > 10'd143 && countH < 10'd784) && (countV > 10'd34 && countV < 10'd515))? 1'b1 : 1'b0; //Pixel enable signal 
		addrH = (countH > 10'd143 && countH < 10'd784)? (countH - 10'd144) : 10'd0;  //column address
		addrV = (countV > 10'd34 && countV < 10'd515) ? (countV - 10'd35) : 10'd0;   //row address
	end
	
	
endmodule