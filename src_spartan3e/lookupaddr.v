/* hongbo
	look up address.
	transform addrH (0-639) to pixelH (0-15)
	transform addrV (0-479) to pixelV (0-15)
	ATTENTION: 
	1. since the picture is square, so only 480 pixels out of 640 have color info, 
		the other 160 pixels (first 80 and last 80) are left black.
	2. this is v2, in this version, the output will be pixelH and pixelV, rather than addr (0-255)
		transforming from pixelH and pixelV to addr is left for module getpixel
*/

module lookupaddr(
	input wire [9:0] addrH,
	input wire [9:0] addrV,
	output reg [3:0] pixelH,
	output reg [3:0] pixelV,
	output reg romEN
);

	
	always @ (*)
	begin
		
		// set up pixelV
		if (addrV < 10'd30)
			pixelV = 4'd0;
		else if (addrV < 10'd60)
			pixelV = 4'd1;
		else if (addrV < 10'd90)
			pixelV = 4'd2;
		else if (addrV < 10'd120)
			pixelV = 4'd3;
		else if (addrV < 10'd150)
			pixelV = 4'd4;
		else if (addrV < 10'd180)
			pixelV = 4'd5;
		else if (addrV < 10'd210)
			pixelV = 4'd6;
		else if (addrV < 10'd240)
			pixelV = 4'd7;
		else if (addrV < 10'd270)
			pixelV = 4'd8;
		else if (addrV < 10'd300)
			pixelV = 4'd9;
		else if (addrV < 10'd330)
			pixelV = 4'd10;
		else if (addrV < 10'd360)
			pixelV = 4'd11;
		else if (addrV < 10'd390)
			pixelV = 4'd12;
		else if (addrV < 10'd420)
			pixelV = 4'd13;
		else if (addrV < 10'd450)
			pixelV = 4'd14;
		else 
			pixelV = 4'd15;
	end
	
	always @ (*)
	begin
		// set up pixelH
		if (addrH < 10'd110)
			pixelH = 4'd0;
		else if (addrH < 10'd140)
			pixelH = 4'd1;
		else if (addrH < 10'd170)
			pixelH = 4'd2;
		else if (addrH < 10'd200)
			pixelH = 4'd3;
		else if (addrH < 10'd230)
			pixelH = 4'd4;
		else if (addrH < 10'd260)
			pixelH = 4'd5;
		else if (addrH < 10'd290)
			pixelH = 4'd6;
		else if (addrH < 10'd320)
			pixelH = 4'd7;
		else if (addrH < 10'd350)
			pixelH = 4'd8;
		else if (addrH < 10'd380)
			pixelH = 4'd9;
		else if (addrH < 10'd410)
			pixelH = 4'd10;
		else if (addrH < 10'd440)
			pixelH = 4'd11;
		else if (addrH < 10'd470)
			pixelH = 4'd12;
		else if (addrH < 10'd500)
			pixelH = 4'd13;
		else if (addrH < 10'd530)
			pixelH = 4'd14;
		else 
			pixelH = 4'd15;
		
		// set up romEN
		if (addrH < 10'd80 || addrH > 10'd560)
			romEN = 1'b0;
		else 
			romEN = 1'b1;
	end
			
	

endmodule