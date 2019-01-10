`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2019 01:15:46 PM
// Design Name: 
// Module Name: ripple_tb
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


module ripple_tb(

    );
    reg Reset, clk;
    wire [3:0] A;
    ripple exa(A,clk,Reset);
    initial
     begin
     clk=0;
     Reset=1;
     #5 Reset=0;
     #200 Reset=1;
     #5 Reset=0;
     end
    always
    begin
    #5 clk=~clk;
    end
endmodule
