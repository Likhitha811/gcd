`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2022 21:19:51
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath(clk,rst,in1,in2,agb,aeb,alb,a_sel,b_sel,a_ld,b_ld,output_en,out);
input[3:0]in1,in2;
input clk,rst,a_sel,b_sel,a_ld,b_ld,output_en,agb,aeb,alb;
output [3:0]out;
wire [3:0] ta_in,tb_in,ta_out,tb_out,t1,t2;
mux m1(t1,in1,a_sel,ta_in);
mux m2(t2,in2,b_sel,tb_in);
subtractor s1(ta_out,tb_out,t1);
subtractor s2(tb_out,ta_out,t2);
register r1(clk,rst,ta_in,a_ld,ta_out);
register r2(clk,rst,tb_in,b_ld,tb_out);
register r3(clk,rst,ta_out,output_en,out);
comparator c1(ta_out,tb_out,agb,alb,aeb);
endmodule



module mux(in1,in2,sel,out);
input sel;
input [3:0]in1,in2;
output reg [3:0]out;
always@(in1 or in2 or sel)
begin
case(sel)
1'b0:out<=in1;
1'b1:out<=in2;
endcase
end
endmodule


module register(clk,rst,in,ld_en,out);
input [3:0]in;
input clk,rst,ld_en;
output reg [3:0]out;
always@(posedge clk)
begin
if (rst==1)
out<=0;
else if(ld_en==1)
out<=in;
end
endmodule

module subtractor(in1,in2,out);
input [3:0]in1,in2;
output reg [3:0]out;
always@(in1 or in2)
begin
out<=in1-in2;
end
endmodule


module comparator(a,b,agb,alb,aeb);
input [3:0]a,b;
output reg agb,aeb,alb;
always@(a or b)
begin
if(a<b)
{alb,agb,aeb}<=3'b100;
else if(a>b)
{alb,agb,aeb}<=3'b010;
else if(a==b)
{alb,agb,aeb}<=3'b001;
end
endmodule