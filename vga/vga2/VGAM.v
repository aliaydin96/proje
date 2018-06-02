
module VGAM(
clock50MHz,		// FPGA's own 20 MHz clock
enable,			// Active low enable signal
VGA_R,			// Red output pixel
VGA_G,			// Green output pixel
VGA_B,			// Blue output pixel
VGA_CLK,			// VGA Clock (25 MHz)
VGA_SYNC_N,		// VGA Sync, active low forces sync o special black level
VGA_BLANK_N,	// VGA blank, active low forces black pixels
VGA_VS,			// VGA Vertical Sync
VGA_HS			// VGA Horizontal Sync
);

input wire clock50MHz;

input wire enable;

output wire [7:0] VGA_R;
output wire [7:0] VGA_G;
output wire [7:0] VGA_B;

output wire VGA_CLK;
output wire VGA_SYNC_N;
output wire VGA_BLANK_N;
output wire VGA_VS;
output wire VGA_HS;

// Create a 25 MHz clock

wire clock25MHz;

CLOCKDIVIDER #(.DIV(2))
generator25(
.clock_input(clock50MHz),
.clock_output(clock25MHz)
);

// Instantiate the VGA Signal Module to handle signals

wire video_enable;

VGASignalModule vgasm(
.clock25MHz(clock25MHz),
.enable(enable),
.VGA_CLK(VGA_CLK),
.VGA_SYNC_N(VGA_SYNC_N),
.VGA_BLANK_N(VGA_BLANK_N),
.VGA_VS(VGA_VS),
.VGA_HS(VGA_HS),
.video_enable(video_enable)
);

// Instantiate the picture-containing RAM

wire [7:0] write_data;
wire write_enable;
reg [18:0] ram_address = 19'd0;
wire [7:0] pixel_data;

// Turn off write enable and write data

assign write_enable = 1'b0;
assign write_data = 8'd0;

VGATESTRAM vgaram(
.address(ram_address),
.clock(clock25MHz),
.data(write_data),
.wren(write_enable),
.q(pixel_data)
);

// Advance the RAM address if the video enable signal is on,
// so that new pixels can be read

always @ (posedge clock25MHz) begin
	if(~video_enable) begin
		if (ram_address == 19'd307199)
			ram_address <= 0;
		else
			ram_address <= ram_address + 19'd1;
	end
end

// if the enable signal is on, all three of R, G and B should show the RAM
// output

assign VGA_R = (~video_enable) ? pixel_data : 8'd000;
assign VGA_G = (~video_enable) ? pixel_data : 8'd000;
assign VGA_B = (~video_enable) ? pixel_data : 8'd000;

endmodule





module VGASignalModule(
clock25MHz,
enable,
VGA_CLK,
VGA_SYNC_N,
VGA_BLANK_N,
VGA_VS,
VGA_HS,
video_enable
);

// IO Wires

input wire clock25MHz;

input wire enable;

output wire VGA_CLK;
output wire VGA_SYNC_N;
output wire VGA_BLANK_N;
output wire VGA_VS;
output wire VGA_HS;
output wire video_enable;

// Clock Generator Setup

wire clock31kHz;

CLOCKDIVIDER #(.DIV(800))
generator31(
.clock_input(clock25MHz),
.clock_output(clock31kHz)
);

// Set BLANK and SYNC signals as always off

assign VGA_BLANK_N = 1'b1;

// Assign 25 MHz to the VGA clock

assign VGA_CLK = clock25MHz;

// Instantiate a vertical synchronizer

localparam VSC = 10'd2; 	// Vertical Sync. Clock Count
localparam BPV = 10'd33; 	// Vertical Back Porch Clock Count
localparam VSV = 10'd480; 	// Vertical Video Signal Clock Count
localparam FPV = 10'd10; 	// Vertical Front Porch Clock Count

wire h_enable; // the video signal of VS enables HS

SYNCHRONIZER #(.SYNC_CNT(VSC), .BP_CNT(BPV), .VS_CNT(VSV), .FP_CNT(FPV))
vsyncer(
.clock(clock31kHz),
.enable(enable),
.sync_signal(VGA_VS),
.video_signal(h_enable)
);

localparam HSC = 10'd96; 	// Horizontal Sync. Clock Count
localparam BPH = 10'd48; 	// Horizontal Back Porch Clock Count
localparam VSH = 10'd640; 	// Horizontal Video Signal Clock Count
localparam FPH = 10'd16; 	// Horizontal Front Porch Clock Count

SYNCHRONIZER #(.SYNC_CNT(HSC), .BP_CNT(BPH), .VS_CNT(VSH), .FP_CNT(FPH))
hsyncer(
.clock(clock25MHz),
.enable(h_enable),
.sync_signal(VGA_HS),
.video_signal(video_enable)
);

// VGA Sync should be low when video signal is high

assign VGA_SYNC_N = 1'b0;


endmodule

module SYNCHRONIZER(
clock,
enable,
sync_signal,
video_signal
);

parameter SYNC_CNT = 96;
parameter BP_CNT = 48;
parameter VS_CNT = 640;
parameter FP_CNT = 16;

input wire clock;
input wire enable;

output wire sync_signal;
output wire video_signal;

wire [9:0] count;
reg clear = 1'b0;

COUNTER10BIT line_counter(
.clock(clock),
.clear(clear),
.enable(enable),
.count(count)
);

localparam SYNC = 2'd0;
localparam BACK_PORCH = 2'd1;
localparam VIDEO_SIGNAL = 2'd2;
localparam FRONT_PORCH = 2'd3;

reg [1:0] state = SYNC;

assign video_signal = (state == VIDEO_SIGNAL) ? 1'b0 : 1'b1;
assign sync_signal = (state == SYNC) ? 1'b0 : 1'b1;

always @ (posedge clock) begin
	if (~enable) begin
		case (state)
			SYNC: begin
				if (count == SYNC_CNT-2) begin
					clear <= 1'b0;
					state <= BACK_PORCH;
				end
				else
					clear <= 1'b1;
			end
			BACK_PORCH:	begin
				if (count == BP_CNT-2) begin
					clear <= 1'b0;
					state <= VIDEO_SIGNAL;
				end
				else
					clear <= 1'b1;
			end
			VIDEO_SIGNAL: begin
				if (count == VS_CNT-2) begin
					clear <= 1'b0;
					state <= FRONT_PORCH;
				end
				else
					clear <= 1'b1;
			end
			FRONT_PORCH: begin
				if (count == FP_CNT-2) begin
					clear <= 1'b0;
					state <= SYNC;
				end
				else
					clear <= 1'b1;
			end
		endcase
	end
	else begin
		state <= SYNC;
		clear <= 1'b1;
	end
end

endmodule

module COUNTER10BIT(
clock, // Counter clock input
clear, // Active low synchronous clear
enable,// Active low enable input
count  // Counter output
);

input wire clock;
input wire clear;
input wire enable;

output reg [9:0] count = 10'd0;

always @ (posedge clock) begin
	if (~enable) begin
		if (~clear)
			count <= 10'd0;
		else
			count <= count + 10'd1;
	end
	else
		count <= 10'd0;
end

endmodule

module CLOCKDIVIDER(
clock_input,
clock_output
);

parameter DIV = 2;

input wire clock_input;
output reg clock_output = 1'b0;

reg [31:0] counter = 32'd0;
wire [31:0] counter_limit = (DIV >> 1) - 1;

always @ (posedge clock_input) begin
	if(counter == counter_limit) begin
		counter <= 32'd0;
		clock_output <= ~clock_output;
	end
	else
		counter <= counter + 32'd1;
end

endmodule
