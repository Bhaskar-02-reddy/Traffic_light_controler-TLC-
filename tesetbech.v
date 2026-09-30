`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2026 20:13:10
// Design Name: 
// Module Name: tesetbech
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


module tesetbech;
reg clk,reset;
wire  p1_stright,p1_right,p1_yellow,p1_red;
wire  p2_stright,p2_left,p2_yellow,p2_red;
wire  p3_left,p3_right,p3_red,p3_yellow;

top   #(.operating_freq(10) )uut ( clk,reset,
 p1_stright,p1_right,p1_yellow,p1_red,
 p2_stright,p2_left,p2_yellow,p2_red,
 p3_left,p3_right,p3_red,p3_yellow );
 
 
 
initial begin
    clk=0;
    reset=1;
    
    #50;
    
    reset=0;
    
    #1000;
    $finish;
    
    
    
    end
always #10 clk=~clk;  // delay of 10 nano second clk freqency 





    
endmodule
