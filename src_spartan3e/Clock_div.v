   /*turn system clock to vga clock.
	for nexys 4 ddr system clock is 100MHz
	for sparten3e system clock is 50MHz
	vga clock is 25MHz, for 640*480*60 mode
	*/
module Clock_div(
    Sys_clock,
    Pixel_clock
    );
input wire Sys_clock;
output reg Pixel_clock = 1'b0;


reg [1:0] count = 2'd0;

	

always @(posedge Sys_clock)
begin
//if ( count == 2'd1)	//nexys4
if ( count == 2'd0)		//sparten3e
begin
Pixel_clock <= ~Pixel_clock;
count <= 2'd0;
end
else
count <= count + 2'd1;
end


endmodule
