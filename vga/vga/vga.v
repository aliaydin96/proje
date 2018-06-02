module vga
	(
		input wire clk, reset,
		input wire [7:0] sw,
		output wire hsync, vsync,
		output wire [7:0] rgb
	);
	
	// register for Basys 2 8-bit RGB DAC 
	reg [7:0] rgb_reg;
	
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;

        // instantiate vga_sync
        vga_sync(.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                             .video_on(video_on), .p_tick(), .x(), .y());
   
        // rgb buffer
        always @(posedge clk, posedge reset)
        if (reset)
           rgb_reg <= 0;
        else begin
           rgb_reg <= sw;
        end
        // output
        assign rgb = ((video_on==0) ? rgb_reg : 8'b00010010);
endmodule
