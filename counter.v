`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2019 12:51:52 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input reset,
    input clk,
    output wire [3:0] out
    );
    reg [3:0] ctr;
   
    assign out=ctr;
    always@(posedge clk)
    begin
    if (reset==1)
    begin
    ctr<=4'b0011;    
    end
    else if (ctr==4'b1011)
    begin
    ctr<=4'b0011;    
    end
    else
    ctr<=ctr+1;
    end
      
endmodule