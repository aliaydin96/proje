/*
  STORAGE UNIT

  This unit is the middlelink between the ADC and the Computation Unit.

  | ADC |--( write_en=0->1, data_in )-->|STORAGE|--( memory )-->| COMPUTATION |


  The storage unit has two states, defined as READ and WRITE states. To enable
  the WRITE state, ADC {write_en} output should go from LOW to HIGH. When it is
  so, the storage unit writes the {data_in} output of the ADC to the {memory_}
  register's {index} index. Then the {index} is incremented by one. If {index}
  is 62499 or {reset} input is given, the index is set to be zero.

  If {write_en} is zero, the system goes into the READ state, where the
  {memory_} element is assigned to the {memory} output if {write_en==0}.

  WARNING:
    - Once {reset} is called, resetting the {memory_} can be useful.
    - The write_en should only be set to high when the 12-bit data is ready,
      and should only be high for one clock cycle of the ADC.
*/

module storage (
  input read_clk,
  input write_en,
  input[11: 0] data_in,
  input reset,
  output reg[11: 0] latest_output,
  output reg[6: 0] index, 
  output reg[6: 0] read_index
  ); 
  
  initial begin
	index <= 7'b0; 
	latest_output <= 12'b0;
  end
  reg reset_flag;
  // memory of 127x12, 62500 is the number of samples that can be taken out
  // of a 10Hz signal, I think. Hope it works.
  reg[11: 0] memory [127: 0];


  always @ (posedge write_en) begin
    memory[index] <= data_in;
	 read_index <= index;
    index <= index + 1;
    reset_flag <= (reset | index == 'd127); // reset or end of the memory.
    if(reset_flag) begin
      index <= 7'b0;
    end
  end

  always @ (posedge read_clk) begin
    if(~write_en) begin
      latest_output <= memory[read_index];
    end
  end

endmodule // storage

module storage_tb ();
  reg [11: 0] data_in;
  reg write_en;
  reg read_clk;
  reg reset;
  wire[11:0] latest_output;
  wire[6:0] index, read_index;
  storage DUT (read_clk,
          write_en,
          data_in,
          reset,
          latest_output,
			 index,
			 read_index
          );

  always // no sensitivity list, so it always executes
    begin
      read_clk = 0; write_en = 0; #1; 
      read_clk = 0; write_en = 1; #1;
		read_clk = 0; write_en=0; #3;
		read_clk = 1; #5;// 10ns period end
    end

  initial begin
	 reset = 0;
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
    data_in = 12'b000000000001;
    #10
    data_in = 12'b00000000010;
    #10
    data_in = 12'b000000000011;
    #10
    data_in = 12'b000000000100;
    #10
    data_in = 12'b000000000101;
    #10
    data_in = 12'b000000000110;
    #10
    data_in = 12'b000000000111;
    #10
    data_in = 12'b000000001000;
    #10
    data_in = 12'b000000001001;
	 #10
	 data_in = 12'b000010001001;
	 #10
	 $finish;
  // The {latest_output} should change only when {data_in} is supplied when
  // {write_en} is HIGH.
  end
endmodule // storage_tb
