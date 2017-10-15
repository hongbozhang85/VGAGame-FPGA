module doubledebounce (input wire btn1,
input wire btn2,
input wire vgaclk,
input wire reset,
output wire btn1_deb,
output wire btn2_deb	//X0 represents the input for the "btn1", X1 for the "btn2"
);

wire pulse;

// heartbeat generator instantiation
heartbeat #(20) hb(.sysclk(vgaclk),.reset(reset),.pulse(pulse));

//debouncer variables
reg [2:0] ff0, ff1;   // debouncer flipflop chains for signal 0 and 1
reg ff0_out, ff1_out; // flipflops for single pulse on transition


always @(posedge vgaclk) begin    //events which happen at every clock cycle	
  	ff0_out<=ff0[0]&ff0[1]&ff0[2]; 
	ff1_out<=ff1[0]&ff1[1]&ff1[2];
	if(reset) begin
	   ff0<=3'b0;
	   ff1<=3'b0;
	end
	else if(pulse) begin //debouncer section transitions are enabled by pulse
	     ff0[0]<=btn1&(~btn2);
	     ff0[1]<=ff0[0];
	     ff0[2]<=ff0[1];

	     ff1[0]<=btn2&(~btn1);
	     ff1[1]<=ff1[0];
	     ff1[2]<=ff1[1];
	   end
end


//output logic
assign	btn1_deb=(ff0[0]&ff0[1]&ff0[2])&(~ff0_out);
assign	btn2_deb=(ff1[0]&ff1[1]&ff1[2])&(~ff1_out);

endmodule
