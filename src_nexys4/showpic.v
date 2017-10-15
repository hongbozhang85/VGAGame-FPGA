/* hongbo
	the function of this module is to show a picture.
*/
module showpic(
	input wire vgaclk,
	input wire btn1,
	input wire btn2,
	input wire btn3,
	input wire btn4,
	input wire reset,
	input wire sw1,
	input wire [3:0] pixelH,
	input wire [3:0]pixelV,
	output wire inv_to_ROM,
	output wire [7:0] addr_to_ROM,
	output wire [3:0] index_to_ROM
	
);
	

	
	selectpic sp(.btn1_de(btn1), .btn2_de(btn2), .sw1(sw1), .vgaclk(vgaclk), .index(index_to_ROM));
	getpixel gp(.pixelH(pixelH), .pixelV(pixelV), .vgaclk(vgaclk), .reset(reset), .btn3_de(btn3), .btn4_de(btn4), .addr(addr_to_ROM), .inv(inv_to_ROM));
	

endmodule
