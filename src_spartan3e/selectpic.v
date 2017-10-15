/* hongbo
	select a picture from picrom. 
	press btn2 to select previous one, press btn1 to select next one.
	switch sw1 for carton.
	0.67s per pic
*/

module selectpic(
	btn1_de, // debounced btn
	btn2_de,
	sw1, // carton
	vgaclk,
	index
);
	
	parameter totalpic = 4'd13;
	output reg [3:0] index = 4'd0;
	input wire btn1_de;
	input wire btn2_de;
	input wire vgaclk;
	input wire sw1;
	
	reg [23:0] counter; 

	always @ (posedge vgaclk) begin
	
		counter <= counter + 24'd1;
	
		if (~sw1)  // not carton mode 
			case ( {btn1_de, btn2_de} )
				2'b10: index <= ((index> (totalpic-4'd2)) ? 4'd0 : (index + 4'd1));
				
				2'b01: index <= ((index<4'd1) ? (totalpic-4'd1) : (index - 4'd1));
			
				default: index <= index;
			endcase
		else // carton mode
			if ( &counter)
				index <= ((index> (totalpic-4'd2)) ? 4'd0 : (index + 4'd1));
			else 
				index <= index;
				
	end


endmodule