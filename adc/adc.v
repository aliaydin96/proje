module adc(analog_in, adc_in, clk, adc_cs, adc_out);
input clk;
input analog_in;
input adc_in;
input adc_cs;
output reg [11:0] adc_out;
// enes sanirim burda bunlari input olarak alip
// top levelde output gosterip oyle deger verecegiz
always @(negedge clk)
begin

adc_out <= {analog_in, adc_out[11:1]}; // serial to parallel

end
endmodule
