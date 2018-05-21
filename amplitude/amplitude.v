module amplitude(voltage,clk,out);
input [15:0] voltage;
input clk;
output reg [15:0] out;

reg [15:0] max;
reg [15:0] min;
initial 
begin 
out = 0; 
max=0;
min=0;

end

always @(posedge clk)
begin
	if(max<voltage) max<=voltage;
	else max<=max;
	
	if(min>voltage) min<=voltage;
	else min<=min;

	
	out<= max-min;

end
endmodule
