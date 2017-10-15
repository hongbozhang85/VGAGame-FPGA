/* hongbo
	display an arrow in appropriate position
	Apr 23
		just inverse the color of the pixels where arrow located.
	Apr 25
		display an inverse colored arrow. with bugs
	Apr 26
		bugs are fixed.
*/

`include "pic_arrow.v"

module arrow ( 
	input wire vgaclk, 
	input wire reset,
	input wire pixelEN,
	input wire movearrow,
	input wire isarrow,
	input wire rin,
	input wire gin,
	input wire bin,
	input wire romEN,
	output reg rout,
	output reg gout,
	output reg bout
);
	
	reg [9:0] counter = 10'd0; 
	reg [2:0] arrowImg = 3'b111;

	always @(posedge vgaclk) begin
		if (reset) counter <= 10'd0;
		else
			if ( movearrow ) counter <= 10'd0;
			else
				if (romEN && pixelEN && isarrow)
					case (counter)
						10'd899: counter <= 10'd0;
						default: counter <= counter + 10'd1;
					endcase
				else counter <= counter;
	end
	
	
	always @(*) begin
		if ( romEN && isarrow ) `arrow
		else arrowImg = 3'b111;
	end
	

	always @(*) begin	
		if ( romEN ) begin
			if ( isarrow ) begin
				rout = ~(rin ^ arrowImg[2]);
				gout = ~(gin ^ arrowImg[1]);
				bout = ~(bin ^ arrowImg[0]);
			end
			else begin
				rout = rin;
				gout = gin;
				bout = bin;
			end
		end
		else begin
			rout = 1'b0;
			gout = 1'b0;
			bout = 1'b0;
		end
	end
	
endmodule