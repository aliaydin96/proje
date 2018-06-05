module frequency(clk,data,freq_out,mean);

	input clk;
	input [13:0] mean;
	input [11:0] data;
	output reg [31:0] freq_out;
	reg [1:0] mode;
	
	integer counter;
	
	integer freq_const;
	//
	//integer counter_clk;
	//reg clk_en;
	
	initial begin
		counter <= 'd0;
		//counter_clk <= 'd0;
		mode <= 2'b00;
		freq_out <= 32'b0;
		freq_const <= 'd50000000;  // clk frequency

	end
	/*
	always @(posedge clk) begin
	
		if(counter_clk == 'd499) begin
			counter_clk <= 'd0;
			clk_en = 1;
		end else begin
			counter_clk <= counter_clk + 1;
			clk_en <= 0;
		end
		
	end*/
	
	always @(posedge clk) begin
				
		if(data < mean && mode == 2'b00) begin
			counter <= counter + 'd1;
		end else if(data > mean && mode == 2'b00) begin

			freq_out <=  freq_const / counter;
			counter <= 'd1;
			mode <= 2'b11;
		end else if(data > mean && mode == 2'b11) begin
			counter <= counter + 'd1; 
			mode <= 2'b01;
		end else if(data > mean && mode == 2'b01) begin
			counter <= counter + 'd1;
		end else if(data < mean && mode == 2'b01) begin
			counter <= counter + 'd1;
			mode <= 2'b00;
		end
		
	end	
	
endmodule
