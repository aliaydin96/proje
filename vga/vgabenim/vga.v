module vga(clk, vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B, vga_clk, vga_blank, vga_sync);
input clk;
output vga_h_sync, vga_v_sync, vga_clk, vga_blank, vga_sync;
output reg [7:0] vga_R,vga_G,vga_B;

wire inDisplayArea;
wire [9:0] CounterX;
wire [8:0] CounterY;
reg bal;


integer clk_25;
integer vpp_sayi1=3;
integer vpp_sayi2=1;
integer vrms_sayi1=6;
integer vrms_sayi2=9;
integer offset_sayi1=5;
integer offset_sayi2=2;
integer freq_sayi1=3;
integer freq_sayi2=0;
integer freq_sayi3=9;
integer freq_sayi4=3;
integer freq_sayi5=4;
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
//////////////////////////
///mod 2 counter
always @(posedge clk)
begin
	clk_25 <= ~clk_25;
end

///////////////////////////////////
/////////// hiyerarsi
hvsync_generator(.clk(clk_25), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), 
                            .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));

/////////////////////////////////////////////									
////////// Ekran kenarliklari

always @(posedge clk_25)
begin
  if(inDisplayArea)begin
  /////////////////////////////////
		if(CounterY==0 || CounterY==479) begin
			if(0<=CounterX && CounterX<680) begin
				vga_G <= 8'h00;vga_R <= 8'hFF;vga_B <= 8'h00;		// cerceve ust ve alt ksim
			end
			else begin
				vga_R <= 8'h00;vga_G <= 8'h00;vga_B <= 8'h00;  end
		end
/////////////////////////////////////////
		if(CounterX==0 || CounterX==679) begin 					///cerceve yan kisimlar
			if(0<=CounterY && CounterY<480) begin
				vga_G <= 8'h00;vga_R <= 8'hFF;vga_B <= 8'h00;
				end
			end
		else begin
			vga_R <= 8'h00;vga_G <= 8'h00;vga_B <= 8'h00;  end	
		////////////////////////////////////////////////////////////	
			
		if(40 < CounterX && CounterX< 601) 			//// ekrandaki dikdortgenin ust ve alt kenarlari cizdirmek icin yazildi
			begin
			if((CounterY==41 )||(CounterY ==439)) begin
				vga_G <= 8'hFF;vga_R <= 8'h00;vga_B <= 8'h00;
				end
			else begin
				vga_R <= 8'h00;vga_G <= 8'h00;vga_B <= 8'h00;
				end
			end
			//////////////////////////////////////////////////////
		if((CounterX == 41)||(CounterX==600))		////dikey kenarlari olusturma
			begin
			if(40<CounterY && CounterY<440)
				begin
		
				vga_G <= 8'hFF;vga_R <= 8'h00;vga_B <= 8'h00;
				end
		
			else begin
				vga_R <= 8'h00;vga_G <= 8'h00;vga_B <= 8'h00;  end
  
			end
		//////////////////////////////////////////////////
		if(41<CounterX && CounterX<51)   /// Yatay centikler
			begin
			if(CounterY==41 || CounterY==80 || CounterY==120 || CounterY==160 || CounterY==200 || CounterY==240 || CounterY==280
						|| CounterY==320 || CounterY==360 || CounterY==400 || CounterY==439)
						begin
						vga_G <= 8'hFF;vga_R <= 8'h00;vga_B <= 8'h00;
						end
			else begin
					vga_R <= 8'h00;vga_G <= 8'h00;vga_B <= 8'h00;
					
					end
			end
		///////////////////////////////////////////////////////////////
		if(430<CounterY && CounterY<439) begin   // Dikey centikler
			if(CounterX==41 || CounterX==80 || CounterX==120 || CounterX==160 || CounterX==200 || CounterX==240 || CounterX==280 ||
						CounterX==320 || CounterX==360 || CounterX==400 || CounterX==440 || CounterX==480 || CounterX==520 || CounterX==560 || CounterX==600)
						begin
							vga_G <= 8'hFF;vga_R <= 8'h00;vga_B <= 8'h00;
						end
				else begin
					vga_R <= 8'h00;vga_G <= 8'h00;vga_B <= 8'h00;
					
				end
		end
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				//vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B<=(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
				vga_B <= (a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8) ? 8'hFF : 0;
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
			r7 = (CounterY==460 && (CounterX>458 && CounterX<470));
		end					
		
		
		endcase
		vga_B <= (a1||a2||a3||a4||a5||a6||a7||a8||b1||b2||b3||b4||b5||b6||b7||c1||c2||c3||c4||c5||c6||c7||c8||d1||d2||d3||d4||d5||d6||d7
					||e1||e2||e3||e4||e5||e6||e7||e8||f1||f2||f3||f4||f5||f6||f7||k1||k2||k3||k4||k5||k6||k7||m1||m2||m3||m4||m5||m6||m7
					||n1||n2||n3||n4||n5||n6||n7||p1||p2||p3||p4||p5||p6||p7||r1||r2||r3||r4||r5||r6||r7 ) ? 8'hFF : 0;

		
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