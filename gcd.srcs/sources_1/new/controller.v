`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2022 22:13:15
// Design Name: 
// Module Name: controller
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


module controller(go,clk,rst,aeb,agb,alb,a_sel,b_sel,a_ld,b_ld,output_en,done);
input clk,rst,go,aeb,alb,agb;
output reg a_sel,b_sel,a_ld,b_ld,output_en,done;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;
reg [2:0]ps,ns;
always@(posedge clk)
begin
if(rst)
ps<=go;
else
ps<=ns;
end
always@(go or ps or agb or alb or aeb)
begin
case(ps)
s0:begin
if(go==0)
ns<=s0;
else
ns<=s1;
end
s1:ns<=s2;
s2:ns<=s3;
s3:begin
if(agb==1)
ns<=s4;
else if(alb==1)
ns<=s5;
else if(aeb==1)
ns<=s6;
end
s4:ns<=s7;
s5:ns<=s7;
s6:ns<=s0;
s7:ns<=s3;
default: ns<=s0;
endcase
end

always@(go or agb or alb or aeb or ps)
begin
case(ps)
s0:begin
a_sel<=0;
b_sel<=0;
a_ld<=0;
b_ld<=0;
output_en<=0;
done<=0;
end
s1:begin
a_sel<=1;
b_sel<=1;
a_ld<=1;
b_ld<=1;
output_en<=0;
done<=0; end
s2:begin
a_sel<=0;
b_sel<=0;
a_ld<=0;
b_ld<=0;
output_en<=0;
done<=0;
end
s3:begin
a_sel<=0;
b_sel<=0;
a_ld<=0;
b_ld<=0;
output_en<=0;
done<=0;
end
s4:begin
a_sel<=0;
b_sel<=0;
a_ld<=1;
b_ld<=0;
output_en<=0;
done<=0;
end
s5:begin
a_sel<=0;
b_sel<=0;
a_ld<=0;
b_ld<=1;
output_en<=0;
done<=0;
end
s6:begin
a_sel<=0;
b_sel<=0;
a_ld<=0;
b_ld<=0;
output_en<=1;
done<=1;
end
s7: begin
a_sel<=0;
b_sel<=0;
a_ld<=0;
b_ld<=0;
output_en<=0;
done<=0; end
default:begin
a_sel<=0;
b_sel<=0;
a_ld<=0;
b_ld<=0;
output_en<=0;
done<=0;end
endcase
end
endmodule
