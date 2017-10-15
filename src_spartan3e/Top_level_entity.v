module Top_level_entity(
    input Sys_clock,   //Systemclock
    input power_sw,    //sw1
	 input reset_sw_R_input,    //sw2
	 input carton_G_input_mode,   //sw3
	 input B_input_checkwin,      //sw4
	 input btnc_change_function,  //central button:changing function
	 input btne_forword_change_color_right,  //right(east) button: func01:change color,func02:next picture,func03:move right
	 input btnw_backward_left,               //left button(west): func02:prev picture, func03: move left
	 input btnn_rotate_up,                   //up button(north):func02:rotate the picture func03:move up
	 input btns_toggle_color_down,           //down botton(south):func02:toggle color func03:move down
    output HS_output,                       //HS signal output
    output VS_output,                       //VS signal output	                                         
    output reg R_output,                    //Red signal output
    output reg G_output,                    //Grenn signal output
    output reg B_output,                    //Bluw signal output
	 /*
	 output reg [3:0]R_output,               //These are the same but nexys4 required 4 bit per color
    output reg [3:0]G_output,
    output reg [3:0]B_output,
	 */
	 output reg [2:0] LED_output
    );

wire Pixel_clock;
wire Pixel_enable;
wire func1_R_output;
wire func1_G_output;
wire func1_B_output;
wire func2_R_output;
wire func2_G_output;
wire func2_B_output;
wire func3_R_output;
wire func3_G_output;
wire func3_B_output;
wire [9:0] Pixel_row_addr;
wire [9:0] Pixel_col_addr;
wire btne_forword_change_color_right_deb;
wire btnw_backward_left_deb;
wire change_func_deb;
wire btnn_rotate_up_deb;
wire btns_toggle_color_down_deb;
wire func02_enable;
wire [3:0] pixelH_output; 
wire [3:0] pixelV_output; 
wire romEN_to_ROM;  

 

wire r_from_rom;    
wire g_from_rom;    
wire b_from_rom;    

wire btne_forword_change_color_right_deb_to_func01;
wire btne_forword_change_color_right_deb_to_func02;
wire btne_forword_change_color_right_deb_to_func03;

wire btnw_backward_left_deb_to_func02;
wire btnw_backward_left_deb_to_func03;

wire carton_G_input_mode_func02;
wire carton_G_input_mode_func03;


wire func02_inv_output;
wire [7:0] func02_addr_output;
wire [3:0] func02_index_output;
wire func03_inv_output;
wire [7:0] func03_addr_output;


reg inv_to_rom;    
reg [3:0] picrom_index_reg; 
reg [7:0] addr_to_rom;   
reg func02_select;
reg func01_select;
reg func03_select;
reg Sys_reset;
reg [1:0] func_state=2'b00;
reg R_output_origin;
reg G_output_origin;
reg B_output_origin;

/* For Nexys4
reg [3:0]R_output_origin;
reg [3:0]G_output_origin;
reg [3:0]B_output_origin;
*/

//instantiation modules 

Clock_div  uut01(
                 .Sys_clock(Sys_clock),
					  .Pixel_clock(Pixel_clock)
);


vgacontroller uut02(
                 .reset(Sys_reset),
					  .vgaclk(Pixel_clock),
					  .pixelEN(Pixel_enable),
					  .HS(HS_output),
					  .VS(VS_output),
					  .addrH(Pixel_col_addr),
					  .addrV(Pixel_row_addr)
);

debounce db01(
                 .X0(btnc_change_function),
					  .sysclk(Pixel_clock),
					  .reset(Sys_reset),
					  .X0_deb(change_func_deb)
);

doubledebounce deb_btn12(.btn1(btne_forword_change_color_right), .btn2(btnw_backward_left), .vgaclk(Pixel_clock), .reset(Sys_reset), .btn1_deb(btne_forword_change_color_right_deb), .btn2_deb(btnw_backward_left_deb));
doubledebounce deb_btn34(.btn1(btnn_rotate_up), .btn2(btns_toggle_color_down), .vgaclk(Pixel_clock), .reset(Sys_reset), .btn1_deb(btnn_rotate_up_deb), .btn2_deb(btns_toggle_color_down_deb));






Function_one uut03(
					  .Pixel_clock(Pixel_clock),
					  .R_input(reset_sw_R_input),
					  .G_input(carton_G_input_mode),
					  .B_input(B_input_checkwin),
					  .change_color(btne_forword_change_color_right_deb_to_func01),
					  .red_reg(func1_R_output),
					  .green_reg(func1_G_output),
					  .blue_reg(func1_B_output)
);
showpic uut04(
					  .vgaclk(Pixel_clock),
					  .btn1(btne_forword_change_color_right_deb_to_func02),
					  .btn2(btnw_backward_left_deb_to_func02),
					  .btn3(btnn_rotate_up_deb),
					  .btn4(btns_toggle_color_down_deb),
					  .reset(~func02_enable),
					  .sw1(carton_G_input_mode_func02),
					  .pixelH(pixelH_output),
					  .pixelV(pixelV_output),
					  .inv_to_ROM(func02_inv_output),
					  .addr_to_ROM(func02_addr_output),
					  .index_to_ROM(func02_index_output)
);
assign func2_R_output=r_from_rom;
assign func2_G_output=g_from_rom;
assign func2_B_output=b_from_rom;



playgame uut5(   
                 .vgaclk(Pixel_clock),
					  .pixelEN(Pixel_enable),
					  .right_deb(btne_forword_change_color_right_deb_to_func03),
					  .left_deb(btnw_backward_left_deb_to_func03),
					  .up_deb(btnn_rotate_up_deb),
					  .down_deb(btns_toggle_color_down_deb),
					  .reset(~func03_enable),
					  .mode(carton_G_input_mode_func03),
					  .pixelH(pixelH_output),
					  .pixelV(pixelV_output),
					  .r_from_ROM(r_from_rom),
					  .g_from_ROM(g_from_rom),
					  .b_from_ROM(b_from_rom),
					  .checkwin(B_input_checkwin),
					  .romEN(romEN_to_ROM),
					  .r(func3_R_output),
					  .g(func3_G_output),
					  .b(func3_B_output),
					  .inv_to_ROM(func03_inv_output),
					  .addr_to_ROM(func03_addr_output)
);


lookupaddr uut06(
                 .addrH(Pixel_col_addr),
					  .addrV(Pixel_row_addr),
					  .pixelH(pixelH_output),
					  .pixelV(pixelV_output),
					  .romEN(romEN_to_ROM)
);

picrom     uut07(
                 .addr(addr_to_rom),
					  .romEN(romEN_to_ROM),
					  .index(picrom_index_reg),
					  .inv(inv_to_rom),
					  .r(r_from_rom),
					  .g(g_from_rom),
					  .b(b_from_rom)
);
//end instantiation modules


// System reset signal
always@(posedge Pixel_clock)
begin
if((~func01_select)&&reset_sw_R_input)
   Sys_reset<=1'b1;
else
   Sys_reset<=1'b0;
end



//function-select (Top_level) state machine
always@(posedge Pixel_clock)
begin
   case(func_state)	
	    2'b00:
		      begin
				if(change_func_deb)
				begin
				  func_state<=2'b01;
				end
				else
				begin
				   func_state<=2'b00;
					func01_select<=1'b1;
				   func02_select<=1'b0;
					func03_select<=1'b0;
					LED_output<={1'b0,1'b0,1'b1};
				end
				end
		 2'b01:
		      begin
				if(change_func_deb)
				begin
				   func_state<=2'b10;
				end
				else
				begin
				   func_state<=2'b01;
					func01_select<=1'b0;
				   func02_select<=1'b1;
					func03_select<=1'b0;
					LED_output<={1'b0,1'b1,1'b1};
				end
				end
		 2'b10:
		      begin
				if(change_func_deb)
				begin
				   func_state<=2'b00;
				end
				else
				begin
				   func_state<=2'b10;
					func01_select<=1'b0;
				   func02_select<=1'b0;
					func03_select<=1'b1;
					LED_output<={1'b1,1'b1,1'b1};
				end
				end
		 default:
		      begin
				   func_state<=2'b00;
	            func01_select<=1'b1;
	            func02_select<=1'b0;
					func03_select<=1'b0;
					LED_output<={1'b0,1'b0,1'b1};
				end
	 endcase
end



//address to rom selection logic
always@(*)
begin
if(func02_select)
begin
   addr_to_rom=func02_addr_output;
end
else if(func03_select)
     begin
	      addr_to_rom=func03_addr_output;
	  end
	  else
	  begin
	      addr_to_rom=func02_addr_output;
	  end
end


//register that store picture index
always@(posedge Pixel_clock)
begin
    picrom_index_reg<=func02_index_output;
end


//inv signal to rom selection logic
always@(*)
begin
if(func02_select)
begin
   inv_to_rom=func02_inv_output;
end
else if(func03_select)
     begin
	      inv_to_rom=func03_inv_output;
	  end
	  else
	  begin
	      inv_to_rom=func02_inv_output;
	  end
end

// func02 and func03 enable signal(if not enable then reset the function) 
assign func02_enable=func02_select && (~Sys_reset);
assign func03_enable=func03_select && (~Sys_reset);


//dmux for east button, prevent interference between functions
assign btne_forword_change_color_right_deb_to_func02=(func02_select)? btne_forword_change_color_right_deb:1'b0;
assign btne_forword_change_color_right_deb_to_func03=(func03_select)? btne_forword_change_color_right_deb:1'b0;
assign btne_forword_change_color_right_deb_to_func01=(func01_select)? btne_forword_change_color_right_deb:1'b0;

//dmux for west button, prevent interference between functions
assign btnw_backward_left_deb_to_func02=(func02_select)? btnw_backward_left_deb:1'b0;
assign btnw_backward_left_deb_to_func03=(func03_select)? btnw_backward_left_deb:1'b0;

//dmux for sw3, prevent interference between functions
assign carton_G_input_mode_func02=(func02_select)? carton_G_input_mode:1'b0;
assign carton_G_input_mode_func03=(func03_select)? carton_G_input_mode:1'b0;


//spartan 3E version of mux for color output from three functions
always@(*)
begin
   if(func01_select)
	begin
	  R_output_origin= func1_R_output;
	  G_output_origin= func1_G_output;
	  B_output_origin= func1_B_output;
	end
	else
	  if(func02_select)
	  begin
	    R_output_origin= func2_R_output;
	    G_output_origin= func2_G_output;
	    B_output_origin= func2_B_output;
	  end
	  else
	  begin
	    R_output_origin= func3_R_output;
	    G_output_origin= func3_G_output;
	    B_output_origin= func3_B_output;
	  end
end
				   

//mux between color signal and black signal according to power sw and pixel_enable from vgacontroller
always@(*)
begin
     if ( ~(power_sw && Pixel_enable))
	  begin
	    R_output=1'b0;
	    G_output=1'b0;
	    B_output=1'b0;
	  end
	  else
	  begin
	    R_output=R_output_origin;
	    G_output=G_output_origin;
	    B_output=B_output_origin;
	  end
end

/*Nexys4 version*/ //Nexys4 version of mux for color output from three functions
/*
always@(*)
begin
   if(func01_select)
	begin
	  R_output_origin= {func1_R_output,func1_R_output,func1_R_output,func1_R_output};
	  G_output_origin= {func1_G_output,func1_G_output,func1_G_output,func1_G_output};
	  B_output_origin= {func1_B_output,func1_B_output,func1_B_output,func1_B_output};
	end
	else
	  if(func02_select)
	  begin
	    R_output_origin= {func2_R_output,func2_R_output,func2_R_output,func2_R_output};
	    G_output_origin= {func2_G_output,func2_G_output,func2_G_output,func2_G_output};
	    B_output_origin= {func2_B_output,func2_B_output,func2_B_output,func2_B_output};
	  end
	  else
	  begin
	    R_output_origin= {func3_R_output,func3_R_output,func3_R_output,func3_R_output};
	    G_output_origin= {func3_G_output,func3_G_output,func3_G_output,func3_G_output};
	    B_output_origin= {func3_B_output,func3_B_output,func3_B_output,func3_B_output};
	  end
end
				   

//mux between color signal and black signal according to power sw and pixel_enable from vgacontroller
always@(*)
begin
     if ( ~(power_sw && Pixel_enable))
	  begin
	    R_output=4'b0000;
	    G_output=4'b0000;
	    B_output=4'b0000;
	  end
	  else
	  begin
	    R_output=R_output_origin;
	    G_output=G_output_origin;
	    B_output=B_output_origin;
	  end
end
*/


endmodule
