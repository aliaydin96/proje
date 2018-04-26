module control(clk,start_button,switch,led_out,ssm);

input clk, start_button;
input [1:0] switch;
output reg [9:0] led_out;
output reg [3:0] ssm;
integer counter;
reg clock_en;
integer start_counter, ssm_counter;
integer tb,ta,led_out1;

initial 
begin
counter<=0;
clock_en<=0;
start_counter<=0;
led_out<=0;
ssm_counter =0;
led_out1=0;
tb=0;
ta=0;
end

// clock divider to 2hz and 1 hz
always @(posedge clk)
begin
	if(switch==2'b11 || switch== 2'b01)
		begin
			if(counter=='d49999999)
			begin
				counter<=0;
				clock_en<=1;
			end
		else 
			begin	
				counter<=counter+1;
				clock_en<=0;
			end
	end
	else if(switch==2'b10)
	begin
		if(counter=='d24999999)
			begin
				counter<=0;
				clock_en<=1;
			end
			else 
			begin	
			counter<=counter+1;
			clock_en<=0;
			end
	end else begin
		counter<='d0;
		clock_en <=0;
	end
	 
	 

end

//start_counter

always @(posedge clk)
begin
	if(start_button ==0 && start_counter<'d2)
	begin
		start_counter<=start_counter+1;
		
	end
	else if(start_button==1)
	begin 
	start_counter<=0;
	end


end


//state machine

always @(posedge clk)
begin 
	if(start_counter=='d1) 
			begin 
			tb <= 1;
			led_out <= 9'b0;
			led_out1=0;
			ta <= 1;
			end
			
	case(switch)
		2'b01:begin  if(tb==1 && led_out<=9'b1111111111  )
				begin
						led_out<={led_out[9:0],1'b1};
						ssm<='d9-led_out1;
						led_out1<= led_out1 +1;
						if ( led_out==9'b1111111111) tb<=0;
		
				end
				end
		
		2'b10:begin if(tb==1 && led_out<9'b0011111111 )
		begin
			 
						led_out<={led_out[6:0],1'b1};
						if(ssm_counter==1)begin
							ssm_counter <= 0;
							
						end else begin
							ssm <= 'd3-(led_out1);
							led_out1<= led_out1 +1;
							ssm_counter <= ssm_counter +'d1;
						end
						if(led_out==9'b0011111111) tb<=0;
						
		end end
		
		2'b11: begin if(ta==1)
		begin
				led_out <= ~led_out;
				ssm<='d10;

				
		end
		end
		default: begin
			ta <=0;
			tb<= 0;
			led_out <=0;
			led_out1<=0;
		end
	endcase
		
end

endmodule 