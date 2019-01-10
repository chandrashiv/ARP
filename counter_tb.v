`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2019 12:55:14 PM
// Design Name: 
// Module Name: counter_tb
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



module counter_tb( );
    reg reset;
    reg clk;
    wire [3:0] out; 
     counter exa(reset,clk,out);
     initial 
     begin
     clk=1;
     reset=1;
     #5
     clk=0;
     reset=0;
     #100 reset=1;
     #5 reset=0;
     end
    always 
    begin
    #5 clk=~clk;
    end
endmodule
