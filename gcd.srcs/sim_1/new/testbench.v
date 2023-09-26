`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2022 22:55:33
// Design Name: 
// Module Name: testbench
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


module testbench;
reg clk,rst,go;
reg [3:0]in1,in2;
wire [3:0]out;
wire done;
initial begin
clk=0;
rst=1;
go=0;
#5 rst=0;
#10 go=1;
end
gcd dut(clk,rst,go,in1,in2,out,done);
always #5 clk=~clk;
initial begin
#20 in1=15;in2=5;
#100 in1=6;in2=9;
#100 in1=3;in2=10;
#100 in1=14;in2=7;
end
endmodule
