/* hongbo
	this module is to transform pixelH (0-15) and pixelV(0-15) to addr (0-255)
	it is the state machine of function 2.
*/

module getpixel(
	input wire [3:0] pixelH,
	input wire [3:0] pixelV,
	input wire vgaclk,
	input wire reset,
	input wire btn3_de,
	input wire btn4_de,
	output reg [7:0] addr,
	output reg inv
);

	reg [1:0] countrotate = 2'b00;

	always @ (posedge vgaclk) begin
		if (reset) begin
			inv <= 1'b0;
			countrotate <= 2'b00;
		end
		else begin
			// set inv (inverse color)
			if (btn4_de) inv <= ~inv;
			// set countrotate
			if (btn3_de) countrotate <= countrotate + 2'b01;			
		end
	end
	
	// addr according to rotation (btn3_de)
	always @(*) begin
		case (countrotate)
			2'b00: addr = {pixelV, pixelH}; // North
			2'b01: addr = {~pixelH, pixelV}; // East
			2'b10: addr = {~pixelV, ~pixelH}; // South
			2'b11: addr = {pixelH, ~pixelV}; // West
		endcase
	end
	
endmodule