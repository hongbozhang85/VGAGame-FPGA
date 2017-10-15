/* hongbo
	this is rom of bit pictures.
	Apr 10. currently, there is only one pic, for testing purpose
	Apr 11. add all 13 pics.
	Apr 12. add inv 
*/

`include "pic_bomb.v"
`include "pic_go1.v"
`include "pic_go2.v"
`include "pic_mario1.v"
`include "pic_mario2.v"
`include "pic_penguin1.v"
`include "pic_penguin2.v"
`include "pic_penguin3.v"
`include "pic_penguin4.v"
`include "pic_star.v"
`include "pic_stop1.v"
`include "pic_stop2.v"
`include "pic_toad.v"

module picrom(
	input wire [7:0] addr,
	input wire romEN,
	input wire [3:0] index,
	input wire inv,
	output reg r,
	output reg g,
	output reg b
);

	reg [2:0] tmp;
	
	always @(*)
	begin
	
		case (index)
			4'd0: `go1
			4'd1: `go2
			4'd2: `stop1
			4'd3: `stop2
			4'd4: `mario1
			4'd5: `mario2
			4'd6: `penguin1
			4'd7: `penguin2
			4'd8: `penguin4
			4'd9: `penguin3
			4'd10: `star
			4'd11: `toad
			4'd12: `bomb 
			default: tmp = 3'b0;
		endcase
		
		if (romEN) begin
			r = inv^tmp[2];
			g = inv^tmp[1];
			b = inv^tmp[0];
		end
		else begin
			r = 1'b0;
			g = 1'b0;
			b = 1'b0;
		end
	
	end

endmodule