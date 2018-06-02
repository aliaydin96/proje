module vga(
    input clk,
    //output reg [2:0] pixel,
    output hsync_out,
    output vsync_out, vga_clk, sync, blank,
	 output wire [7:0] rgb,
	 output wire [7:0] gg,
	 output wire [7:0] bb
	 
);
    wire inDisplayArea;
    wire [9:0] CounterX;
	 reg [7:0] rgb_reg;
	 reg [7:0] gg_reg;
	 reg [7:0] bb_reg;
	 
	 integer clk_25;
initial begin
 rgb_reg = 8'b0;
 clk_25 = 0;
end

always @(posedge clk)
begin
	clk_25 <= ~clk_25;
end
	 
    hvsync_generator hvsync(
      .clk(clk_25),
      .vga_h_sync(hsync_out),
      .vga_v_sync(vsync_out),
		.vga_clk(vga_clk),
		.sync(sync),
		.blank(blank),
      .CounterX(CounterX),
      //.CounterY(CounterY),
      .inDisplayArea(inDisplayArea)
    );

always @(posedge clk_25)
begin
	
	rgb_reg <=8'b11110001; 
	gg_reg <= 8'b10101010;
	bb_reg <= 8'b00111001;
end
assign rgb = rgb_reg;
assign gg = gg_reg;
assign bb = bb_reg;
	 /*
    always @(posedge clk_25)
    begin
      if (inDisplayArea)
        pixel <= CounterX[9:6];
      else // if it's not to display, go dark
        pixel <= 3'b010;
    end
*/
endmodule
