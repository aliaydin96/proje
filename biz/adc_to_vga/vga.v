module vga(vpp,offset,freq,clk, vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B, vga_clk, vga_blank, vga_sync,dalgalar,a_sayisi);
input clk;

input wire [11:0] vpp,offset,freq;
input [1:0] dalgalar;
output vga_h_sync, vga_v_sync, vga_clk, vga_blank, vga_sync;
output reg [7:0] vga_R,vga_G,vga_B;
input [1:0] a_sayisi;
wire inDisplayArea;
wire [9:0] CounterX;
wire [8:0] CounterY;
reg bal;
reg [7:0] red,blue,green;

integer clk_25;
integer vpp_sayi1;
integer vpp_sayi2;
integer vrms_sayi1;
integer vrms_sayi2;
integer offset_sayi1;
integer offset_sayi2;
integer freq_sayi1;
integer freq_sayi2;
integer freq_sayi3;
integer freq_sayi4;
integer freq_sayi5;
integer voltdiv1;
integer voltdiv2;
integer timediv1;
integer timediv2;
integer timediv3;
integer timediv4;
integer timediv5;
integer timediv6;

reg [31:0] vpp_reg;
reg [31:0] offset_reg;
reg [31:0] freq_reg;

integer a1, a2, a3,a4,a5,a6,a7,a8;
integer b1,b2,b3,b4,b5,b6,b7;
integer c1,c2,c3,c4,c5,c6,c7,c8;
integer d1,d2,d3,d4,d5,d6,d7;
integer e1,e2,e3,e4,e5,e6,e7,e8;
integer f1,f2,f3,f4,f5,f6,f7;
integer k1,k2,k3,k4,k5,k6,k7;
integer m1,m2,m3,m4,m5,m6,m7;
integer n1,n2,n3,n4,n5,n6,n7;
integer p1,p2,p3,p4,p5,p6,p7;
integer r1,r2,r3,r4,r5,r6,r7;
integer v1,v2,v3,v4,v5,v6,v7,v8;
integer S1,S2,S3,S4,S5,S6,S7;
integer t1,t2,t3,t4,t5,t6,t7;
integer g1,g2,g3,g4,g5,g6,g7;
integer h1,h2,h3,h4,h5,h6,h7;
integer y1,y2,y3,y4,y5,y6,y7;
integer l1,l2,l3,l4,l5,l6,l7;
integer u1,u2,u3,u4,u5,u6,u7;
integer a;
integer clk_1s;
integer count;
integer clk_2;

initial begin

clk_2 = clk;
clk_1s=0;
end
//////////////////////////
///mod 2 counter
always @(posedge clk)
begin
	clk_25 <= ~clk_25;
end

always @(posedge clk_2)
begin
	if(count==60) begin
		count <= 0;
		clk_1s <= ~clk_1s;
	end
		count <= count +1;
end

///////////////////////////////////
/////////// hiyerarsi
hvsync_generator(.clk(clk_25), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), 
                            .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));
									 
									 
always @(*) begin

	vpp_reg =(50*vpp)/4096;
	vpp_sayi1 = vpp_reg/10;
	vpp_sayi2 = vpp_reg%10;
	
	
	offset_reg = (50*offset)/4096;
	offset_sayi1 = offset_reg/10;
	offset_sayi2 = offset_reg%10;

	freq_sayi5 = freq%10;
	freq_sayi4 = (freq/10)%10;
	freq_sayi3 = (freq/100)%10;
	freq_sayi2 = (freq/1000)%10;
	freq_sayi1 = (freq/10000)%10;								 
	case(a_sayisi)
		2'b00: a<=0;
		2'b01: a<=1;
		2'b10: a<=-1;
		2'b11: a<=2;
		default: a<=0;
	endcase				 
									 
end
/////////////////////////////////////////////									
////////// Ekran kenarliklari

always @(posedge clk_25)
begin
  if(inDisplayArea)begin
  /////////////////////////////////
		if(CounterY==0 || CounterY==479) begin
			if(0<=CounterX && CounterX<680) begin
				green <= 8'h00;red <= 8'hFF;blue <= 8'h00;		// cerceve ust ve alt ksim
			end
			else begin
				red <= 8'h00;green <= 8'h00;blue <= 8'h00;  end
		end
/////////////////////////////////////////
		if(CounterX==0 || CounterX==679) begin 					///cerceve yan kisimlar
			if(0<=CounterY && CounterY<480) begin
				green <= 8'h00;red <= 8'hFF;blue <= 8'h00;
				end
			end
		else begin
			red <= 8'h00;green <= 8'h00;blue <= 8'h00;  end	
		////////////////////////////////////////////////////////////	
			
		if((CounterY==41 )||(CounterY ==439))
																	//// ekrandaki dikdortgenin ust ve alt kenarlari cizdirmek icin yazildi
			begin
			if(51 < CounterX && CounterX< 601) begin
				green <= 8'h00;red <= 8'hFF;blue <= 8'hFF;
				end
			else begin
				red <= 8'h00;green <= 8'h00;blue <= 8'h00;
				end
			end
			//////////////////////////////////////////////////////
		if((CounterX == 41)||(CounterX==600))		////dikey kenarlari olusturma
			begin
			if(40<CounterY && CounterY<440)
				begin
		
				green <= 8'h00;red <= 8'hFF;blue <= 8'hFF;
				end
		
			else begin
				red <= 8'h00;green <= 8'h00;blue <= 8'h00;  end
  
			end 
		//////////////////////////////////////////////////
		if(42<CounterX && CounterX<52)   /// Yatay centikler
			begin
			if(CounterY==41 || CounterY==80 || CounterY==120 || CounterY==160 || CounterY==200 || CounterY==240 || CounterY==280
						|| CounterY==320 || CounterY==360 || CounterY==400 || CounterY==439)
						begin
						green <= 8'h00;red <= 8'hFF;blue <= 8'hFF;
						end
			else begin
					red <= 8'h00;green <= 8'h00;blue <= 8'h00;
					
					end
			end
		///////////////////////////////////////////////////////////////
		if(41<CounterY && CounterY<50) begin   // Dikey centikler
			if(CounterX==41 || CounterX==80 || CounterX==120 || CounterX==160 || CounterX==200 || CounterX==240 || CounterX==280 ||
						CounterX==320 || CounterX==360 || CounterX==400 || CounterX==440 || CounterX==480 || CounterX==520 || CounterX==560 || CounterX==600)
						begin
							green <= 8'h00;red <= 8'hFF;blue <= 8'hFF;
						end
				else begin
					red <= 8'h00;green <= 8'h00;blue <= 8'h00;
					
				end
		end
	//	/////////////////////////////////////////
		

		
		
		
		
		
		
	
		
		
		/////////////////////////////////////////// Vpp ilk sayi hanesi	
		
			case(vpp_sayi1)
			0: begin
				a1 = (CounterY==450 && (CounterX>79  && CounterX<91));
				a2 = (CounterX==90  && (CounterY>449 && CounterY<460));
				a3 = (CounterX==90  && (CounterY>459 && CounterY<471));
				a4 = (CounterY==470 && (CounterX>79  && CounterX<91));
				a5 = (CounterX==79  && (CounterY>459 && CounterY<471));
				a6 = (CounterX==79  && (CounterY>449 && CounterY<460));
				a7 = 0;
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			1: begin
				a1 = 0;
				a2 = (CounterX==90  && (CounterY>449 && CounterY<460));
				a3 = (CounterX==90  && (CounterY>459 && CounterY<471));
				a4 = 0;
				a5 = 0;
				a6 = 0;
				a7 = 0;
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			2: begin
				a1 = (CounterY==450 && (CounterX>79  && CounterX<91));
				a2 = (CounterX==90  && (CounterY>449 && CounterY<460));
				a3 = 0;
				a4 = (CounterY==470 && (CounterX>79  && CounterX<91));
				a5 = (CounterX==79  && (CounterY>459 && CounterY<471));
				a6 = 0;
				a7 = (CounterY==460 && (CounterX>79  && CounterX<91));
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			3: begin
				a1 = (CounterY==450 && (CounterX>79  && CounterX<91));
				a2 = (CounterX==90  && (CounterY>449 && CounterY<460));
				a3 = (CounterX==90  && (CounterY>459 && CounterY<471));
				a4 = (CounterY==470 && (CounterX>79  && CounterX<91));
				a5 = 0;
				a6 = 0;
				a7 = (CounterY==460 && (CounterX>79  && CounterX<91));
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			4: begin
				a1 = 0;
				a2 = (CounterX==90  && (CounterY>449 && CounterY<460));
				a3 = (CounterX==90  && (CounterY>459 && CounterY<471));
				a4 = 0;
				a5 = 0;
				a6 = (CounterX==79  && (CounterY>449 && CounterY<460));
				a7 = (CounterY==460 && (CounterX>79  && CounterX<91));
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			5: begin
				a1 = (CounterY==450 && (CounterX>79  && CounterX<91));
				a2 = 0;
				a3 = (CounterX==90  && (CounterY>459 && CounterY<471));
				a4 = (CounterY==470 && (CounterX>79  && CounterX<91));
				a5 = 0;
				a6 = (CounterX==79  && (CounterY>449 && CounterY<460));
				a7 = (CounterY==460 && (CounterX>79  && CounterX<91));
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
																		
			6: begin
				a1 = (CounterY==450 && (CounterX>79  && CounterX<91));
				a2 = 0;
				a3 = (CounterX==90  && (CounterY>459 && CounterY<471));
				a4 = (CounterY==470 && (CounterX>79  && CounterX<91));
				a5 = (CounterX==79  && (CounterY>459 && CounterY<471));
				a6 = (CounterX==79  && (CounterY>449 && CounterY<460));
				a7 = (CounterY==460 && (CounterX>79  && CounterX<91));
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			7: begin
				a1 = (CounterY==450 && (CounterX>79  && CounterX<91));
				a2 = (CounterX==90  && (CounterY>449 && CounterY<460));
				a3 = (CounterX==90  && (CounterY>459 && CounterY<471));
				a4 = 0;
				a5 = 0;
				a6 = 0;
				a7 = 0;
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			8: begin
				a1 = (CounterY==450 && (CounterX>79  && CounterX<91));
				a2 = (CounterX==90  && (CounterY>449 && CounterY<460));
				a3 = (CounterX==90  && (CounterY>459 && CounterY<471));
				a4 = (CounterY==470 && (CounterX>79  && CounterX<91));
				a5 = (CounterX==79  && (CounterY>459 && CounterY<471));
				a6 = (CounterX==79  && (CounterY>449 && CounterY<460));
				a7 = (CounterY==460 && (CounterX>79  && CounterX<91));
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			9: begin
				a1 = (CounterY==450 && (CounterX>79 && CounterX<91));
				a2 = (CounterX==90 && (CounterY>449 && CounterY<460));
				a3 = (CounterX==90 && (CounterY>459 && CounterY<471));
				a4 = (CounterY==470 && (CounterX>79 && CounterX<91));
				a5 = 0;
				a6 = (CounterX==79 && (CounterY>449 && CounterY<460));
				a7 = (CounterY==460 && (CounterX>79  && CounterX<91));
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));
			end
			default: begin
				a1 = (CounterY==450 && (CounterX>79 && CounterX<91));
				a2 = (CounterX==90 && (CounterY>449 && CounterY<460));
				a3 = (CounterX==90 && (CounterY>459 && CounterY<471));
				a4 = (CounterY==470 && (CounterX>79 && CounterX<91));
				a5 = (CounterX==79 && (CounterY>459 && CounterY<471));
				a6 = (CounterX==79 && (CounterY>449 && CounterY<460));
				a7 = 0;
				a8 = ((468<CounterY && CounterY<471) && (CounterX>93 && CounterX<96));			
			end
		
		endcase
		/////////////// Vpp ikinci kisimlar
		
			case(vpp_sayi2)
			0: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = (CounterY==470 && (CounterX>98 && CounterX<108));
				b5 = (CounterX==98 && (CounterY>459 && CounterY<471));
				b6 = (CounterX==98 && (CounterY>449 && CounterY<460));
				b7 = 0;
			end
			1: begin
				b1 = 0;
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = 0;
				b5 = 0;
				b6 = 0;
				b7 = 0;
			end
			2: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = 0;
				b4 = (CounterY==470 && (CounterX>98 && CounterX<108));
				b5 = (CounterX==98 && (CounterY>459 && CounterY<471));
				b6 = 0;
				b7 = (CounterY==460 && (CounterX>98  && CounterX<108));
			end
			3: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = (CounterY==470 && (CounterX>98 && CounterX<108));
				b5 = 0;
				b6 = 0;
				b7 = (CounterY==460 && (CounterX>98  && CounterX<108));
			end
			4: begin
				b1 = 0;
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = 0;
				b5 = 0;
				b6 = (CounterX==98 && (CounterY>449 && CounterY<460));
				b7 = (CounterY==460 && (CounterX>98  && CounterX<108));
			end
			5: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = 0;
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = (CounterY==470 && (CounterX>98 && CounterX<108));
				b5 = 0;
				b6 = (CounterX==98 && (CounterY>449 && CounterY<460));
				b7 = (CounterY==460 && (CounterX>98  && CounterX<108));
			end
																		
			6: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = 0;
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = (CounterY==470 && (CounterX>98 && CounterX<108));
				b5 = (CounterX==98 && (CounterY>459 && CounterY<471));
				b6 = (CounterX==98 && (CounterY>449 && CounterY<460));
				b7 = (CounterY==460 && (CounterX>98  && CounterX<108));
			end
			7: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = 0;
				b5 = 0;
				b6 = 0;
				b7 = 0;
			end
			8: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = (CounterY==470 && (CounterX>98 && CounterX<108));
				b5 = (CounterX==98 && (CounterY>459 && CounterY<471));
				b6 = (CounterX==98 && (CounterY>449 && CounterY<460));
				b7 = (CounterY==460 && (CounterX>98  && CounterX<108));
			end
			9: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = (CounterY==470 && (CounterX>98 && CounterX<108));
				b5 = 0;
				b6 = (CounterX==98 && (CounterY>449 && CounterY<460));
				b7 = (CounterY==460 && (CounterX>98  && CounterX<108));
				
			end 
			default: begin
				b1 = (CounterY==450 && (CounterX>98  && CounterX<108));
				b2 = (CounterX==108 && (CounterY>449 && CounterY<460));
				b3 = (CounterX==108 && (CounterY>459 && CounterY<471));
				b4 = (CounterY==470 && (CounterX>98 && CounterX<108));
				b5 = (CounterX==98 && (CounterY>459 && CounterY<471));
				b6 = (CounterX==98 && (CounterY>449 && CounterY<460));
				b7 = (CounterY==460 && (CounterX>98  && CounterX<108));
							
			end
		
		endcase
		////////// Vrms ilk hanesi
		case(vrms_sayi1)
			0:begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = (CounterY==470 && (CounterX>158 && CounterX<168));
				c5 = (CounterX==158 && (CounterY>459 && CounterY<471));
				c6 = (CounterX==158 && (CounterY>449 && CounterY<460));
				c7 = 0;
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end
			1:begin
				c1 = 0;
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = 0;
				c5 = 0;
				c6 = 0;
				c7 = 0;
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end
			2:begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = 0;
				c4 = (CounterY==470 && (CounterX>158 && CounterX<168));
				c5 = (CounterX==158 && (CounterY>459 && CounterY<471));
				c6 = 0;
				c7 = (CounterY==460 && (CounterX>158  && CounterX<168));
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end
			3:begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = (CounterY==470 && (CounterX>158 && CounterX<168));
				c5 = 0;
				c6 = 0;
				c7 = (CounterY==460 && (CounterX>158  && CounterX<168));
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end
			4:begin
				c1 = 0;
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = 0;
				c5 = 0;
				c6 = (CounterX==158 && (CounterY>449 && CounterY<460));
				c7 = (CounterY==460 && (CounterX>158  && CounterX<168));
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end			
			5:begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = 0;
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = (CounterY==470 && (CounterX>158 && CounterX<168));
				c5 = 0;
				c6 = (CounterX==158 && (CounterY>449 && CounterY<460));
				c7 = (CounterY==460 && (CounterX>158  && CounterX<168));
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end
			6:begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = 0;
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = (CounterY==470 && (CounterX>158 && CounterX<168));
				c5 = (CounterX==158 && (CounterY>459 && CounterY<471));
				c6 = (CounterX==158 && (CounterY>449 && CounterY<460));
				c7 = (CounterY==460 && (CounterX>158  && CounterX<168));
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end			
			7:begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = 0;
				c5 = 0;
				c6 = 0;
				c7 = 0;
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end			
			8:begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = (CounterY==470 && (CounterX>158 && CounterX<168));
				c5 = (CounterX==158 && (CounterY>459 && CounterY<471));
				c6 = (CounterX==158 && (CounterY>449 && CounterY<460));
				c7 = (CounterY==460 && (CounterX>158  && CounterX<168));
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end
			9:begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = (CounterY==470 && (CounterX>158 && CounterX<168));
				c5 = 0;
				c6 = (CounterX==158 && (CounterY>449 && CounterY<460));
				c7 = (CounterY==460 && (CounterX>158  && CounterX<168));
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));						
			end			
			default: begin
				c1 = (CounterY==450 && (CounterX>158  && CounterX<168));
				c2 = (CounterX==168 && (CounterY>449 && CounterY<460));
				c3 = (CounterX==168 && (CounterY>459 && CounterY<471));
				c4 = (CounterY==470 && (CounterX>158 && CounterX<168));
				c5 = (CounterX==158 && (CounterY>459 && CounterY<471));
				c6 = (CounterX==158 && (CounterY>449 && CounterY<460));
				c7 = 0;
				c8 = ((468<CounterY && CounterY<471) && (CounterX>170 && CounterX<173));				
				end		
		endcase
		
		//////// Vrms ikinci sayi
		case(vrms_sayi2)
			0: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = (CounterY==470 && (CounterX>177  && CounterX<187));
				d5 = (CounterX==177 && (CounterY>459  && CounterY<471));
				d6 = (CounterX==177 && (CounterY>449  && CounterY<460));
				d7 = 0;			
				end
			1: begin
				d1 = 0;
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = 0;
				d5 = 0;
				d6 = 0;
				d7 = 0;			
				end	
			2: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = 0;
				d4 = (CounterY==470 && (CounterX>177  && CounterX<187));
				d5 = (CounterX==177 && (CounterY>459  && CounterY<471));
				d6 = 0;
				d7 = (CounterY==460 && (CounterX>177  && CounterX<187));			
				end			
			3: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = (CounterY==470 && (CounterX>177  && CounterX<187));
				d5 = 0;
				d6 = 0;
				d7 = (CounterY==460 && (CounterX>177  && CounterX<187));			
				end	
			4: begin
				d1 = 0;
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = 0;
				d5 = 0;
				d6 = (CounterX==177 && (CounterY>449  && CounterY<460));
				d7 = (CounterY==460 && (CounterX>177  && CounterX<187));			
				end	
			5: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = 0;
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = (CounterY==470 && (CounterX>177  && CounterX<187));
				d5 = 0;
				d6 = (CounterX==177 && (CounterY>449  && CounterY<460));
				d7 = (CounterY==460 && (CounterX>177  && CounterX<187));			
				end	
			6: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = 0;
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = (CounterY==470 && (CounterX>177  && CounterX<187));
				d5 = (CounterX==177 && (CounterY>459  && CounterY<471));
				d6 = (CounterX==177 && (CounterY>449  && CounterY<460));
				d7 = (CounterY==460 && (CounterX>177  && CounterX<187));			
				end			
			7: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = 0;
				d5 = 0;
				d6 = 0;
				d7 = 0;			
				end	
			8: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = (CounterY==470 && (CounterX>177  && CounterX<187));
				d5 = (CounterX==177 && (CounterY>459  && CounterY<471));
				d6 = (CounterX==177 && (CounterY>449  && CounterY<460));
				d7 = (CounterY==460 && (CounterX>177  && CounterX<187));			
				end	
			9: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = (CounterY==470 && (CounterX>177  && CounterX<187));
				d5 = 0;
				d6 = (CounterX==177 && (CounterY>449  && CounterY<460));
				d7 = (CounterY==460 && (CounterX>177  && CounterX<187));			
				end	
		
			default: begin
				d1 = (CounterY==450 && (CounterX>177  && CounterX<187));
				d2 = (CounterX==187 && (CounterY>449  && CounterY<460));
				d3 = (CounterX==187 && (CounterY>459  && CounterY<471));
				d4 = (CounterY==470 && (CounterX>177  && CounterX<187));
				d5 = (CounterX==177 && (CounterY>459  && CounterY<471));
				d6 = (CounterX==177 && (CounterY>449  && CounterY<460));
				d7 = (CounterY==460 && (CounterX>177  && CounterX<187));			
				end
				
		endcase
		
		/////////////// offsett 1. hanesi
		case(offset_sayi1)
			0: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = (CounterY==470 && (CounterX>247  && CounterX<257));
				e5 = (CounterX==247 && (CounterY>459  && CounterY<471));
				e6 = (CounterX==247 && (CounterY>449  && CounterY<460));
				e7 = 0;
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end
			1: begin
				e1 = 0;
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = 0;
				e5 = 0;
				e6 = 0;
				e7 = 0;
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end
			2: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = 0;
				e4 = (CounterY==470 && (CounterX>247  && CounterX<257));
				e5 = (CounterX==247 && (CounterY>459  && CounterY<471));
				e6 = 0;
				e7 = (CounterY==460 && (CounterX>247  && CounterX<257));
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end
			3: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = (CounterY==470 && (CounterX>247  && CounterX<257));
				e5 = 0;
				e6 = 0;
				e7 = (CounterY==460 && (CounterX>247  && CounterX<257));
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end			
			4: begin
				e1 = 0;
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = 0;
				e5 = 0;
				e6 = (CounterX==247 && (CounterY>449  && CounterY<460));
				e7 = (CounterY==460 && (CounterX>247  && CounterX<257));
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end		
			5: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = 0;
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = (CounterY==470 && (CounterX>247  && CounterX<257));
				e5 = 0;
				e6 = (CounterX==247 && (CounterY>449  && CounterY<460));
				e7 = (CounterY==460 && (CounterX>247  && CounterX<257));
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end		
			6: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = 0;
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = (CounterY==470 && (CounterX>247  && CounterX<257));
				e5 = (CounterX==247 && (CounterY>459  && CounterY<471));
				e6 = (CounterX==247 && (CounterY>449  && CounterY<460));
				e7 = (CounterY==460 && (CounterX>247  && CounterX<257));
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end				
			7: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = 0;
				e5 = 0;
				e6 = 0;
				e7 = 0;
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end			
			8: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = (CounterY==470 && (CounterX>247  && CounterX<257));
				e5 = (CounterX==247 && (CounterY>459  && CounterY<471));
				e6 = (CounterX==247 && (CounterY>449  && CounterY<460));
				e7 = (CounterY==460 && (CounterX>247  && CounterX<257));
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end		
			9: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = (CounterY==470 && (CounterX>247  && CounterX<257));
				e5 = 0;
				e6 = (CounterX==247 && (CounterY>449  && CounterY<460));
				e7 = (CounterY==460 && (CounterX>247  && CounterX<257));
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end			
			default: begin
				e1 = (CounterY==450 && (CounterX>247  && CounterX<257));
				e2 = (CounterX==257 && (CounterY>449  && CounterY<460));
				e3 = (CounterX==257 && (CounterY>459  && CounterY<471));
				e4 = (CounterY==470 && (CounterX>247  && CounterX<257));
				e5 = (CounterX==247 && (CounterY>459  && CounterY<471));
				e6 = (CounterX==247 && (CounterY>449  && CounterY<460));
				e7 = (CounterY==460 && (CounterX>247  && CounterX<257));
				e8 = ((468<CounterY && CounterY<471)  && (CounterX>260 && CounterX<263));
			end
		endcase
		
		
		/////// offset 2. hanesi
		case(offset_sayi2)
			0: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = (CounterY==470 && (CounterX>268  && CounterX<278));
				f5 = (CounterX==268 && (CounterY>459  && CounterY<471));
				f6 = (CounterX==268 && (CounterY>449  && CounterY<460));
				f7 = 0;		
			end
			1: begin
				f1 = 0;
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = 0;
				f5 = 0;
				f6 = 0;
				f7 = 0;		
			end		
			2: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = 0;
				f4 = (CounterY==470 && (CounterX>268  && CounterX<278));
				f5 = (CounterX==268 && (CounterY>459  && CounterY<471));
				f6 = 0;
				f7 = (CounterY==460 && (CounterX>268  && CounterX<278));		
			end		
			3: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = 0;
				f5 = 0;
				f6 = (CounterX==268 && (CounterY>449  && CounterY<460));
				f7 = (CounterY==460 && (CounterX>268  && CounterX<278));		
			end		
			4: begin
				f1 = 0;
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = 0;
				f5 = 0;
				f6 = (CounterX==268 && (CounterY>449  && CounterY<460));
				f7 = (CounterY==460 && (CounterX>268  && CounterX<278));		
			end		
			5: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = 0;
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = (CounterY==470 && (CounterX>268  && CounterX<278));
				f5 = 0;
				f6 = (CounterX==268 && (CounterY>449  && CounterY<460));
				f7 = (CounterY==460 && (CounterX>268  && CounterX<278));		
			end		
			6: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = 0;
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = (CounterY==470 && (CounterX>268  && CounterX<278));
				f5 = (CounterX==268 && (CounterY>459  && CounterY<471));
				f6 = (CounterX==268 && (CounterY>449  && CounterY<460));
				f7 = (CounterY==460 && (CounterX>268  && CounterX<278));		
			end		
			7: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = 0;
				f5 = 0;
				f6 = 0;
				f7 = 0;		
			end		
			8: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = (CounterY==470 && (CounterX>268  && CounterX<278));
				f5 = (CounterX==268 && (CounterY>459  && CounterY<471));
				f6 = (CounterX==268 && (CounterY>449  && CounterY<460));
				f7 = (CounterY==460 && (CounterX>268  && CounterX<278));		
			end		
			9: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = (CounterY==470 && (CounterX>268  && CounterX<278));
				f5 = 0;
				f6 = (CounterX==268 && (CounterY>449  && CounterY<460));
				f7 = (CounterY==460 && (CounterX>268  && CounterX<278));		
			end		
			default: begin
				f1 = (CounterY==450 && (CounterX>268  && CounterX<278));
				f2 = (CounterX==278 && (CounterY>449  && CounterY<460));
				f3 = (CounterX==278 && (CounterY>459  && CounterY<471));
				f4 = (CounterY==470 && (CounterX>268  && CounterX<278));
				f5 = (CounterX==268 && (CounterY>459  && CounterY<471));
				f6 = (CounterX==268 && (CounterY>449  && CounterY<460));
				f7 = (CounterY==460 && (CounterX>268  && CounterX<278));		
			end
		endcase

/////////// frekans 1. hanesi		
		case(freq_sayi1)
	0:begin
		k1 = (CounterY==450 && (CounterX>398 && CounterX<411));	
		k2 = (CounterX==410 && (CounterY>449 && CounterY<460));
		k3 = (CounterX==410 && (CounterY>459 && CounterY<471));
		k4 = (CounterY==470 && (CounterX>398 && CounterX<411));
		k5 = (CounterX==399 && (CounterY>459 && CounterY<471));
		k6 = (CounterX==399 && (CounterY>449 && CounterY<460));
		k7 = 0;
		end

		
	1:begin
		k1 = 0;	
		k2 = (CounterX==410 && (CounterY>449 && CounterY<460));
		k3 = (CounterX==410 && (CounterY>459 && CounterY<471));
		k4 = 0;
		k5 = 0;
		k6 = 0;
		k7 = 0;
		end
				

	2:begin
		k1 = (CounterY==450 && (CounterX>398 && CounterX<411));	
		k2 = (CounterX==410 && (CounterY>449 && CounterY<460));
		k3 = 0;
		k4 = (CounterY==470 && (CounterX>398 && CounterX<411));
		k5 = (CounterX==399 && (CounterY>459 && CounterY<471));
		k6 = 0;
		k7 = (CounterY==460 && (CounterX>398 && CounterX<411));
		end
	3:begin
		k1 = (CounterY==450 && (CounterX>398 && CounterX<411));	
		k2 = (CounterX==410 && (CounterY>449 && CounterY<460));
		k3 = (CounterX==410 && (CounterY>459 && CounterY<471));
		k4 = (CounterY==470 && (CounterX>398 && CounterX<411));
		k5 = 0;
		k6 = 0;
		k7 = (CounterY==460 && (CounterX>398 && CounterX<411));
		end		
	default : begin
		
		k1 = (CounterY==450 && (CounterX>398 && CounterX<411));	
		k2 = (CounterX==410 && (CounterY>449 && CounterY<460));
		k3 = (CounterX==410 && (CounterY>459 && CounterY<471));
		k4 = (CounterY==470 && (CounterX>398 && CounterX<411));
		k5 = (CounterX==399 && (CounterY>459 && CounterY<471));
		k6 = (CounterX==399 && (CounterY>449 && CounterY<460));
		k7 = 0;
		
		end
endcase
/////////////////// frekans 2. hanesi
		case(freq_sayi2)
	
	0:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = (CounterY==470 && (CounterX>413 && CounterX<425));
		m5 = (CounterX==413 && (CounterY>459 && CounterY<471));
		m6 = (CounterX==413 && (CounterY>449 && CounterY<460));
		m7 = 0;
		end
		
	1:begin
		m1 = 0;	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = 0;
		m5 = 0;
		m6 = 0;
		m7 = 0;		
		end
		
	2:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = 0;
		m4 = (CounterY==470 && (CounterX>413 && CounterX<425));
		m5 = (CounterX==413 && (CounterY>459 && CounterY<471));
		m6 = 0;
		m7 = (CounterY==460 && (CounterX>413 && CounterX<425));
		end
	3:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = (CounterY==470 && (CounterX>413 && CounterX<425));
		m5 = 0;
		m6 = 0;
		m7 = (CounterY==460 && (CounterX>413 && CounterX<425));
		end
	
	4:begin
		m1 = 0;	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = 0;
		m5 = (CounterX==413 && (CounterY>459 && CounterY<471));
		m6 = 0;
		m7 = (CounterY==460 && (CounterX>413 && CounterX<425));
		end
	
	5:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = 0;
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = (CounterY==470 && (CounterX>413 && CounterX<425));
		m5 = 0;
		m6 = (CounterX==413 && (CounterY>449 && CounterY<460));
		m7 = (CounterY==460 && (CounterX>413 && CounterX<425));
		end
	
	6:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = 0;
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = (CounterY==470 && (CounterX>413 && CounterX<425));
		m5 = (CounterX==413 && (CounterY>459 && CounterY<471));
		m6 = (CounterX==413 && (CounterY>449 && CounterY<460));
		m7 = (CounterY==460 && (CounterX>413 && CounterX<425));
		end
	
	7:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = 0;
		m5 = 0;
		m6 = 0;
		m7 = 0;
		end
	
	8:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = (CounterY==470 && (CounterX>413 && CounterX<425));
		m5 = (CounterX==413 && (CounterY>459 && CounterY<471));
		m6 = (CounterX==413 && (CounterY>449 && CounterY<460));
		m7 = (CounterY==460 && (CounterX>413 && CounterX<425));
		end	
		
	9:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = (CounterY==470 && (CounterX>413 && CounterX<425));
		m5 = 0;
		m6 = (CounterX==413 && (CounterY>449 && CounterY<460));
		m7 = (CounterY==460 && (CounterX>413 && CounterX<425));
		end
	default:begin
		m1 = (CounterY==450 && (CounterX>413 && CounterX<425));	
		m2 = (CounterX==425 && (CounterY>449 && CounterY<460));
		m3 = (CounterX==425 && (CounterY>459 && CounterY<471));
		m4 = (CounterY==470 && (CounterX>413 && CounterX<425));
		m5 = (CounterX==413 && (CounterY>459 && CounterY<471));
		m6 = (CounterX==413 && (CounterY>449 && CounterY<460));
		m7 = 0;
		end

endcase		

/////////////////// frekans 3. hanesi
		case(freq_sayi3)
	
	0:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = (CounterY==470 && (CounterX>428 && CounterX<440));
		n5 = (CounterX==428 && (CounterY>459 && CounterY<471));
		n6 = (CounterX==428 && (CounterY>449 && CounterY<460));
		n7 = 0;
		end
		
	1:begin
		n1 = 0;	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = 0;
		n5 = 0;
		n6 = 0;
		n7 = 0;
		end	
		
	2:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = 0;
		n4 = (CounterY==470 && (CounterX>428 && CounterX<440));
		n5 = (CounterX==428 && (CounterY>459 && CounterY<471));
		n6 = 0;
		n7 = (CounterY==460 && (CounterX>428 && CounterX<440));
		end	
		
	3:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = (CounterY==470 && (CounterX>428 && CounterX<440));
		n5 = 0;
		n6 = 0;
		n7 = (CounterY==460 && (CounterX>428 && CounterX<440));
		end	
				
	
	4:begin
		n1 = 0;	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = 0;
		n5 = 0;
		n6 = (CounterX==428 && (CounterY>449 && CounterY<460));
		n7 = (CounterY==460 && (CounterX>428 && CounterX<440));
		end	
		
	5:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = 0;
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = (CounterY==470 && (CounterX>428 && CounterX<440));
		n5 = 0;
		n6 = (CounterX==428 && (CounterY>449 && CounterY<460));
		n7 = (CounterY==460 && (CounterX>428 && CounterX<440));
		end	
		
	6:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = 0;
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = (CounterY==470 && (CounterX>428 && CounterX<440));
		n5 = (CounterX==428 && (CounterY>459 && CounterY<471));
		n6 = (CounterX==428 && (CounterY>449 && CounterY<460));
		n7 = (CounterY==460 && (CounterX>428 && CounterX<440));
		end	
		
	7:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = 0;
		n5 = 0;
		n6 = 0;
		n7 = 0;
		end	
	8:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = (CounterY==470 && (CounterX>428 && CounterX<440));
		n5 = (CounterX==428 && (CounterY>459 && CounterY<471));
		n6 = (CounterX==428 && (CounterY>449 && CounterY<460));
		n7 = (CounterY==460 && (CounterX>428 && CounterX<440));
		end	
	9:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = (CounterY==470 && (CounterX>428 && CounterX<440));
		n5 = 0;
		n6 = (CounterX==428 && (CounterY>449 && CounterY<460));
		n7 = (CounterY==460 && (CounterX>428 && CounterX<440));
		end	
		
		
	default:begin
		n1 = (CounterY==450 && (CounterX>428 && CounterX<440));	
		n2 = (CounterX==440 && (CounterY>449 && CounterY<460));
		n3 = (CounterX==440 && (CounterY>459 && CounterY<471));
		n4 = (CounterY==470 && (CounterX>428 && CounterX<440));
		n5 = (CounterX==428 && (CounterY>459 && CounterY<471));
		n6 = (CounterX==428 && (CounterY>449 && CounterY<460));
		n7 = 0;
		end	
		

endcase	


	
//////////////////  frekans 4. hanesi		
		case(freq_sayi4)
		0:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = (CounterY==470 && (CounterX>444 && CounterX<456));
			p5 = (CounterX==444 && (CounterY>459 && CounterY<471));
			p6 = (CounterX==444 && (CounterY>449 && CounterY<460));
			p7 = 0;
		end					
		1:begin
			p1 = 0;	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = 0;
			p5 = 0;
			p6 = 0;
			p7 = 0;
		end					
		2:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = 0;
			p4 = (CounterY==470 && (CounterX>444 && CounterX<456));
			p5 = (CounterX==444 && (CounterY>459 && CounterY<471));
			p6 = 0;
			p7 = (CounterY==460 && (CounterX>444 && CounterX<456));
		end					
		3:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = (CounterY==470 && (CounterX>444 && CounterX<456));
			p5 = 0;
			p6 = 0;
			p7 = (CounterY==460 && (CounterX>444 && CounterX<456));
		end					
		4:begin
			p1 = 0;	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = 0;
			p5 = 0;
			p6 = (CounterX==444 && (CounterY>449 && CounterY<460));
			p7 = (CounterY==460 && (CounterX>444 && CounterX<456));
		end					
		5:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = 0;
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = (CounterY==470 && (CounterX>444 && CounterX<456));
			p5 = 0;
			p6 = (CounterX==444 && (CounterY>449 && CounterY<460));
			p7 = (CounterY==460 && (CounterX>444 && CounterX<456));
		end	
		6:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = 0;
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = (CounterY==470 && (CounterX>444 && CounterX<456));
			p5 = (CounterX==444 && (CounterY>459 && CounterY<471));
			p6 = (CounterX==444 && (CounterY>449 && CounterY<460));
			p7 = (CounterY==460 && (CounterX>444 && CounterX<456));
		end			
		7:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = 0;
			p5 = 0;
			p6 = 0;
			p7 = 0;
		end			
		8:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = (CounterY==470 && (CounterX>444 && CounterX<456));
			p5 = (CounterX==444 && (CounterY>459 && CounterY<471));
			p6 = (CounterX==444 && (CounterY>449 && CounterY<460));
			p7 = (CounterY==460 && (CounterX>444 && CounterX<456));
		end			
		9:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = (CounterY==470 && (CounterX>444 && CounterX<456));
			p5 = 0;
			p6 = (CounterX==444 && (CounterY>449 && CounterY<460));
			p7 = (CounterY==460 && (CounterX>444 && CounterX<456));
		end			
		
		default:begin
			p1 = (CounterY==450 && (CounterX>444 && CounterX<456));	
			p2 = (CounterX==456 && (CounterY>449 && CounterY<460));
			p3 = (CounterX==456 && (CounterY>459 && CounterY<471));
			p4 = (CounterY==470 && (CounterX>444 && CounterX<456));
			p5 = (CounterX==444 && (CounterY>459 && CounterY<471));
			p6 = (CounterX==444 && (CounterY>449 && CounterY<460));
			p7 = 0;
		end				
		endcase
///////////////////frekans 5. hanesi
		case(freq_sayi5)
		
		0:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = (CounterY==470 && (CounterX>458 && CounterX<470));
			r5 = (CounterX==458 && (CounterY>459 && CounterY<471));
			r6 = (CounterX==458 && (CounterY>449 && CounterY<460));
			r7 = 0;
		end
		1:begin
			r1 = 0;	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = 0;
			r5 = 0;
			r6 = 0;
			r7 = 0;
		end					
		2:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = 0;
			r4 = (CounterY==470 && (CounterX>458 && CounterX<470));
			r5 = (CounterX==458 && (CounterY>459 && CounterY<471));
			r6 = 0;
			r7 = (CounterY==460 && (CounterX>458 && CounterX<470));
		end					
		3:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = (CounterY==470 && (CounterX>458 && CounterX<470));
			r5 = 0;
			r6 = 0;
			r7 = (CounterY==460 && (CounterX>458 && CounterX<470));
		end					
		4:begin
			r1 = 0;	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = 0;
			r5 = 0;
			r6 = (CounterX==458 && (CounterY>449 && CounterY<460));
			r7 = (CounterY==460 && (CounterX>458 && CounterX<470));
		end					
		5:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = 0;
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = (CounterY==470 && (CounterX>458 && CounterX<470));
			r5 = 0;
			r6 = (CounterX==458 && (CounterY>449 && CounterY<460));
			r7 = (CounterY==460 && (CounterX>458 && CounterX<470));
		end					
		6:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = 0;
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = (CounterY==470 && (CounterX>458 && CounterX<470));
			r5 = (CounterX==458 && (CounterY>459 && CounterY<471));
			r6 = (CounterX==458 && (CounterY>449 && CounterY<460));
			r7 = (CounterY==460 && (CounterX>458 && CounterX<470));
		end					
		7:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = 0;
			r5 = 0;
			r6 = 0;
			r7 = 0;
		end					
		8:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = (CounterY==470 && (CounterX>458 && CounterX<470));
			r5 = (CounterX==458 && (CounterY>459 && CounterY<471));
			r6 = (CounterX==458 && (CounterY>449 && CounterY<460));
			r7 = (CounterY==460 && (CounterX>458 && CounterX<470));
		end					
		9:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = (CounterY==470 && (CounterX>458 && CounterX<470));
			r5 = 0;
			r6 = (CounterX==458 && (CounterY>449 && CounterY<460));
			r7 = (CounterY==460 && (CounterX>458 && CounterX<470));
		end							
		default:begin
			r1 = (CounterY==450 && (CounterX>458 && CounterX<470));	
			r2 = (CounterX==470 && (CounterY>449 && CounterY<460));
			r3 = (CounterX==470 && (CounterY>459 && CounterY<471));
			r4 = (CounterY==470 && (CounterX>458 && CounterX<470));
			r5 = (CounterX==458 && (CounterY>459 && CounterY<471));
			r6 = (CounterX==458 && (CounterY>449 && CounterY<460));
			r7 = 0;
		end					
		
		
		endcase
///////////////////volt div 1. hanesi		
		///////////////////Dalgalar icin
		case(dalgalar)
///////////////////////////// Square wave
		2'b10:begin
		if((CounterX == 80)||(CounterX==240)||(CounterX==400)||(CounterX==560))		
			begin
			if((121<CounterY && CounterY<279))
				begin
		
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00;
				end

			end
		if((CounterY==121 ))		
			begin
			if((80 < CounterX && CounterX< 240)||(400< CounterX && CounterX< 560))begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00;
				end

			end
			
			
		if((CounterY==279))
				
			begin
			if((52 < CounterX && CounterX< 80)||(240 < CounterX && CounterX< 400)||(560< CounterX && CounterX< 590))
				begin
		
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00;
				end

		end		
		end /* //////////// triangular 
		: begin 
			if(59<CounterX && CounterX<141 && 119< CounterY && CounterY<281) begin
				if(CounterY==(-2*CounterX+400)) begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
			if(140<CounterX && CounterX<221 && 119< CounterY && CounterY<281)begin
				if(CounterY==(2*CounterX-160)) begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
			if(220<CounterX && CounterX<301 && 119< CounterY && CounterY<281) begin
				if(CounterY==(-2*(CounterX-160)+400)) begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
			if(300<CounterX && CounterX<381 && 119< CounterY && CounterY<281)begin
				if(CounterY==(2*(CounterX-160)-160))begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
			if(380<CounterX && CounterX<461 && 119< CounterY && CounterY<281) begin
				if(CounterY==(-2*(CounterX-320)+400)) begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
			if(460<CounterX && CounterX<541 && 119< CounterY && CounterY<281)begin
				if(CounterY==(2*(CounterX-320)-160))begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
end
			*///////////////////triangular
		2'b01:begin 
			if(59<CounterX && CounterX<221 && 119< CounterY && CounterY<281) begin
				if(CounterY==(-CounterX+340)) begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
			if(220<CounterX && CounterX<381 && 119< CounterY && CounterY<281)begin
				if(CounterY==(CounterX-100)) begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
			if(380<CounterX && CounterX<541 && 119< CounterY && CounterY<281) begin
				if(CounterY==(-(CounterX-320)+340)) begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
			if(540<CounterX && CounterX<580 && 119< CounterY && CounterY<281)begin
				if(CounterY==(2*(CounterX-320)-100))begin
				green <= 8'hFF;red <= 8'h00;blue <= 8'h00; end
			
			end
end	

		2'b11: begin
			///////////////////////sine
		if (CounterX >= (  104) && CounterX < (  106)&& CounterY>=( 176) && CounterY<=( 178) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  109+a) && CounterX < (  111+a)&& CounterY>=( 189) && CounterY<=( 191) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
		else if (CounterX >= (  114+2*a) && CounterX < (  116+2*a)&& CounterY>=( 202) && CounterY<=( 204) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
		else if (CounterX >= (  119+3*a) && CounterX < (  121+3*a)&& CounterY>=( 216) && CounterY<=( 218) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  124+4*a) && CounterX < (  126+4*a)&& CounterY>=( 231) && CounterY<=( 233) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  129+5*a) && CounterX < (  131+5*a)&& CounterY>=( 245) && CounterY<=( 247) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  134+6*a) && CounterX < (  136+6*a)&& CounterY>=( 258) && CounterY<=( 260) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  140+7*a) && CounterX < (  142+7*a)&& CounterY>=( 270) && CounterY<=( 272) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  146+8*a) && CounterX < (  148+8*a)&& CounterY>=( 281) && CounterY<=( 283) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  152+9*a) && CounterX < (  154+9*a)&& CounterY>=( 290) && CounterY<=( 292) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
		else if (CounterX >= (  158+10*a) && CounterX < (  160+10*a)&& CounterY>=( 297) && CounterY<=( 299) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  164+11*a) && CounterX < (  166+11*a)&& CounterY>=( 301) && CounterY<=( 303) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  170+12*a) && CounterX < (  172+13*a)&& CounterY>=( 303) && CounterY<=( 305) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  176+14*a) && CounterX < (  178+14*a)&& CounterY>=( 303) && CounterY<=( 305) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  182+15*a) && CounterX < (  184+15*a)&& CounterY>=( 299) && CounterY<=( 301) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  188+16*a) && CounterX < (  190+16*a)&& CounterY>=( 294) && CounterY<=( 296) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  194+17*a) && CounterX < (  196+17*a)&& CounterY>=( 286) && CounterY<=( 288) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  200+18*a) && CounterX < (  202+18*a)&& CounterY>=( 276) && CounterY<=( 278) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  206+19*a) && CounterX < (  208+19*a)&& CounterY>=( 264) && CounterY<=( 266) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  212+20*a) && CounterX < (  214+20*a)&& CounterY>=( 251) && CounterY<=( 253) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  218+21*a) && CounterX < (  220+21*a)&& CounterY>=( 239) && CounterY<=( 241) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  224+22*a) && CounterX < (  226+22*a)&& CounterY>=( 223) && CounterY<=( 225) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  230+23*a) && CounterX < (  232+23*a)&& CounterY>=( 209) && CounterY<=( 211) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  236+24*a) && CounterX < (  238+24*a)&& CounterY>=( 195) && CounterY<=( 197) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  242+25*a) && CounterX < (  244+25*a)&& CounterY>=( 182) && CounterY<=( 184) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
		else if (CounterX >= (  248+26*a) && CounterX < (  250+26*a)&& CounterY>=( 171) && CounterY<=( 173) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  254+27*a) && CounterX < (  256+27*a)&& CounterY>=( 161) && CounterY<=( 163) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  260+28*a) && CounterX < (  262+28*a)&& CounterY>=( 153) && CounterY<=( 155) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  266+29*a) && CounterX < (  268+29*a)&& CounterY>=( 147) && CounterY<=( 149) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  272+30*a) && CounterX < (  274+30*a)&& CounterY>=( 144) && CounterY<=( 146) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  278+31*a) && CounterX < (  280+31*a)&& CounterY>=( 143) && CounterY<=( 145) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  284+32*a) && CounterX < (  286+32*a)&& CounterY>=( 145) && CounterY<=( 147) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  290+33*a) && CounterX < (  292+33*a)&& CounterY>=( 150) && CounterY<=( 152) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
		else if (CounterX >= (  296+34*a) && CounterX < (  298+34*a)&& CounterY>=( 156) && CounterY<=( 158) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  302+35*a) && CounterX < (  304+35*a)&& CounterY>=( 166) && CounterY<=( 168) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  308+36*a) && CounterX < (  310+36*a)&& CounterY>=( 176) && CounterY<=( 178) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  314+37*a) && CounterX < (  316+37*a)&& CounterY>=( 188) && CounterY<=( 190) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  320+38*a) && CounterX < (  322+38*a)&& CounterY>=( 202) && CounterY<=( 204) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  326+39*a) && CounterX < (  328+39*a)&& CounterY>=( 216) && CounterY<=( 218) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  332+40*a) && CounterX < (  334+40*a)&& CounterY>=( 232) && CounterY<=( 234) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
		
			else if (CounterX >= (  338+41*a) && CounterX < (  340+41*a)&& CounterY>=( 244) && CounterY<=( 246) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  344+42*a) && CounterX < (  346+42*a)&& CounterY>=( 258) && CounterY<=( 260) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  350+43*a) && CounterX < (  352+43*a)&& CounterY>=( 270) && CounterY<=( 272) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end	
			else if (CounterX >= (  356+44*a) && CounterX < (  358+44*a)&& CounterY>=( 281) && CounterY<=( 283) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  362+45*a) && CounterX < (  364+45*a)&& CounterY>=( 290) && CounterY<=( 292) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  368+46*a) && CounterX < (  370+46*a)&& CounterY>=( 297) && CounterY<=( 299) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  374+47*a) && CounterX < (  376+47*a)&& CounterY>=( 301) && CounterY<=( 303) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  380+48*a) && CounterX < (  382+48*a)&& CounterY>=( 303) && CounterY<=( 305) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  386+49*a) && CounterX < (  388+49*a)&& CounterY>=( 303) && CounterY<=( 305) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  392+50*a) && CounterX < (  394+50*a)&& CounterY>=( 302) && CounterY<=( 304) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  398+51*a) && CounterX < (  400+51*a)&& CounterY>=( 299) && CounterY<=( 301) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  404+52*a) && CounterX < (  406+52*a)&& CounterY>=( 294) && CounterY<=( 296) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  410+53*a) && CounterX < (  412+53*a)&& CounterY>=( 286) && CounterY<=( 288) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  416+54*a) && CounterX < (  418+54*a)&& CounterY>=( 276) && CounterY<=( 278) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  422+55*a) && CounterX < (  424+55*a)&& CounterY>=( 264) && CounterY<=( 266) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  428+56*a) && CounterX < (  430+56*a)&& CounterY>=( 251) && CounterY<=( 253) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  434+57*a) && CounterX < (  436+57*a)&& CounterY>=( 239) && CounterY<=( 241) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  440+58*a) && CounterX < (  442+58*a)&& CounterY>=( 223) && CounterY<=( 225) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  446+59*a) && CounterX < (  448+59*a)&& CounterY>=( 209) && CounterY<=( 211) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  452+60*a) && CounterX < (  454+60*a)&& CounterY>=( 195) && CounterY<=( 197) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  458+61*a) && CounterX < (  460+61*a)&& CounterY>=( 182) && CounterY<=( 184) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
		else if (CounterX >= (  464+62*a) && CounterX < (  466+62*a)&& CounterY>=( 171) && CounterY<=( 173) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  470+63*a) && CounterX < (  472+63*a)&& CounterY>=( 161) && CounterY<=( 163) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  476+64*a) && CounterX < (  478+64*a)&& CounterY>=( 153) && CounterY<=( 155) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  482+65*a) && CounterX < (  484+65*a)&& CounterY>=( 147) && CounterY<=( 149) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  488+66*a) && CounterX < (  490+66*a)&& CounterY>=( 144) && CounterY<=( 146) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  494+67*a) && CounterX < (  496+67*a)&& CounterY>=( 143) && CounterY<=( 145) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  500+68*a) && CounterX < (  502+68*a)&& CounterY>=( 145) && CounterY<=( 147) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  506+69*a) && CounterX < (  508+69*a)&& CounterY>=( 150) && CounterY<=( 152) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
		else if (CounterX >= (  512+70*a) && CounterX < (  514+70*a)&& CounterY>=( 156) && CounterY<=( 158) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  518+71*a) && CounterX < (  520+71*a)&& CounterY>=( 166) && CounterY<=( 168) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  524+72*a) && CounterX < (  526+72*a)&& CounterY>=( 176) && CounterY<=( 178) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  530+73*a) && CounterX < (  532+73*a)&& CounterY>=( 188) && CounterY<=( 190) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  536+74*a) && CounterX < (  538+74*a)&& CounterY>=( 202) && CounterY<=( 204) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  542+75*a) && CounterX < (  544+75*a)&& CounterY>=( 216) && CounterY<=( 218) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  548+76*a) && CounterX < (  550+76*a)&& CounterY>=( 232) && CounterY<=( 234) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  554+77*a) && CounterX < (  556+77*a)&& CounterY>=( 244) && CounterY<=( 246) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  560+78*a) && CounterX < (  562+78*a)&& CounterY>=( 258) && CounterY<=( 260) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  566+79*a) && CounterX < (  568+79*a)&& CounterY>=( 270) && CounterY<=( 272) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end	
			else if (CounterX >= (  572+80*a) && CounterX < (  574+80*a)&& CounterY>=( 281) && CounterY<=( 283) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  578+81*a) && CounterX < (  580+81*a)&& CounterY>=( 290) && CounterY<=( 292) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  584+82*a) && CounterX < (  586+82*a)&& CounterY>=( 297) && CounterY<=( 299) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end
			else if (CounterX >= (  590+83*a) && CounterX < (  592+83*a)&& CounterY>=( 301) && CounterY<=( 303) )
		begin
			red <= 8'b0;
			green <= 8'b11111111;
			blue <= 8'b0;
		end			


end

		endcase
/////////////////////////////////////////////////////////////////////////////////////////////////
				
		
		
		
		
		
		
		
		
		
		vga_B <= (blue) ? 8'hFF : 0;

					
		vga_R <= (a1||a2||a3||a4||a5||a6||a7||a8||b1||b2||b3||b4||b5||b6||b7||c1||c2||c3||c4||c5||c6||c7||c8||d1||d2||d3||d4||d5||d6||d7
					||e1||e2||e3||e4||e5||e6||e7||e8||f1||f2||f3||f4||f5||f6||f7||k1||k2||k3||k4||k5||k6||k7||m1||m2||m3||m4||m5||m6||m7
					||n1||n2||n3||n4||n5||n6||n7||p1||p2||p3||p4||p5||p6||p7||r1||r2||r3||r4||r5||r6||r7||v1||v2||v3||v4||v5||v6||v7||v8
					||S1||S2||S3||S4||S5||S6||S7||t1||t2||t3||t4||t5||t6||t7||g1||g2||g3||g4||g5||g6||g7||h1||h2||h3||h4||h5||h6||h7
					||y1||y2||y3||y4||y5||y6||y7||l1||l2||l3||l4||l5||l6||l7||u1||u2||u3||u4||u5||u6||u7||red) ? 8'hFF : 0;
					
					
		vga_G <= (green) ? 8'hFF : 0;
		
		
  end else begin
  vga_R <= 8'h00;
  vga_G <= 8'h00;
  vga_B <= 8'h00;
  end

end





assign vga_blank = vga_h_sync&vga_v_sync;
assign vga_sync = (vga_h_sync&vga_v_sync);
assign vga_clk = clk_25;
endmodule 