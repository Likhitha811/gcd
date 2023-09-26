`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2022 21:19:14
// Design Name: 
// Module Name: gcd
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

//t2k232190
module gcd(clk,rst,go,in1,in2,out,done);
input clk,rst,go;
input [3:0]in1,in2;
output [3:0]out;
output done;
wire aeb,alb,agb,a_sel,b_sel,a_ld,b_ld,output_en;
controller c(go,clk,rst,aeb,agb,alb,a_sel,b_sel,a_ld,b_ld,output_en,done);
datapath d(clk,rst,in1,in2,agb,aeb,alb,a_sel,b_sel,a_ld,b_ld,output_en,out);
endmodule
