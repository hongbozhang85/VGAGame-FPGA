module debounce (input wire X0,
input wire sysclk,
input wire reset,
output wire X0_deb
);

wire pulse;

// heartbeat generator instantiation
heartbeat #(20) hb(.sysclk(sysclk),.reset(reset),.pulse(pulse));

//debouncer variables
reg [2:0] ff0;   
reg ff0_out; // flipflops for single pulse on transition


always @(posedge sysclk) begin    //events which happen at every clock cycle	
  	ff0_out<=ff0[0]&ff0[1]&ff0[2]; 
	if(reset) begin
	   ff0<=3'b0;
	end
	else if(pulse) begin //debouncer section transitions are enabled by pulse
	     ff0[0]<=X0;
	     ff0[1]<=ff0[0];
	     ff0[2]<=ff0[1];
	   end
end


//output logic
assign	X0_deb=(ff0[0]&ff0[1]&ff0[2])&(~ff0_out);

endmodule
