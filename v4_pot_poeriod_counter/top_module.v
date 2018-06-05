module top_module(clk, reset, ADC_CS_N, ADC_DIN, ADC_SCLK, ADC_DOUT, freq_out);

input clk, reset;

output reg[9:0] freq_out;

output reg ADC_CS_N;
output reg ADC_DIN;
output reg ADC_SCLK;
input ADC_DOUT;

wire [11:0] data;

wire ADc_CS_N_wire;
wire ADC_DIN_wire;
wire ADC_SCLK_wire;

wire [9:0] freq_out_wire;

ADC adc(.clock(clk), .reset(reset), .ADC_CS_N(ADc_CS_N_wire), .ADC_DIN(ADC_DIN_wire), .ADC_SCLK(ADC_SCLK_wire), .ADC_DOUT(ADC_DOUT),.data(data));
period period(.clk(clk),.data(data),.freq_out(freq_out_wire));

always begin
	
	freq_out <= freq_out_wire;
	ADC_CS_N <= ADc_CS_N_wire;
	ADC_DIN <= ADC_DIN_wire;
	ADC_SCLK <= ADC_SCLK_wire;
	
end

endmodule