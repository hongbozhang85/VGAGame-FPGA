/* hongbo
	the function is to play the scramble vga game.
	this is main part of function 3.
*/

module playgame(
	input wire vgaclk,
	input wire pixelEN,
	input wire right_deb,
	input wire left_deb,
	input wire up_deb,
	input wire down_deb,
	input wire reset,
	input wire mode,
	input wire [3:0] pixelH,
	input wire [3:0] pixelV,
	input wire r_from_ROM,
	input wire g_from_ROM,
	input wire b_from_ROM,
	input wire checkwin,
	input wire romEN,
	output wire r,
	output wire g,
	output wire b,
	output wire inv_to_ROM,
	output wire [7:0] addr_to_ROM
);
	
	wire isarrow, movearrow;
	wire tmpB, tmpG, tmpR;
	
	
	arrow arr( .vgaclk(vgaclk), .reset(reset), .pixelEN(pixelEN), .movearrow(movearrow), .isarrow(isarrow), 
		.romEN(romEN), .rin(r_from_ROM), .gin(g_from_ROM), .bin(b_from_ROM), .rout(tmpR), .gout(tmpG), .bout(tmpB) );
	gamecontrol sm( .vgaclk(vgaclk), .right(right_deb), .left(left_deb), .up(up_deb), .down(down_deb),
		.reset(reset), .pixelH(pixelH), .pixelV(pixelV), .mode(mode), .checkwin(checkwin), .addr(addr_to_ROM), 
		.inv(inv_to_ROM), .isarrow(isarrow), .movearrow(movearrow)); //state machine
		
assign r=tmpR;
assign g=tmpG;
assign b=tmpB;

	

endmodule