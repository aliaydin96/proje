module garden_water(clk,start_button,switch,led_out,seven_display);
input clk,start_button;
input [1:0] switch;
output reg [9:0] led_out;
output reg [6:0] seven_display;
wire [3:0] ssm;
reg [3:0] ssm_input;
wire [9:0] led_in;
wire [6:0] ssm_out;

control ( .clk(clk), .start_button(start_button), .switch(switch), .led_out(led_in), .ssm(ssm));
ssm ( .clk(clk), .ssm_input(ssm_input), .seven_display(ssm_out));

always
begin

ssm_input<= ssm;
led_out<=led_in;
seven_display<=ssm_out;
end


endmodule
