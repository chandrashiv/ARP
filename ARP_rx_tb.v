`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2019 05:40:35 PM
// Design Name: 
// Module Name: ARP_rx_tb
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


module ARP_rx_tb(  );
reg [31:0]input_rx;
wire [15:0] hdr_type;
wire [15:0] proto_type;
wire [47:0] send_hdr_addr;
wire [31:0] send_ip_addr;
wire [47:0] target_hdr_addr;
wire [31:0] target_ip_addr;
wire input_ackw;
wire [7:0]hdr_addr_length;
wire [7:0]pro_addr_length;
wire [15:0]operation;
reg clk;
reg rst;

ARP_rx exa(input_rx,hdr_type,proto_type,hdr_addr_length,pro_addr_length,operation,send_hdr_addr,send_ip_addr,target_hdr_addr,target_ip_addr,clk,rst,input_ackw);

initial
begin
clk=0;
rst=1;
#5 rst=0;
input_rx=32'b10000101010110011101010101001101;
#10 input_rx=32'b00010000000100000000000000100110;
#10 input_rx=32'b11101010110101001010111010101101;
#10 input_rx=32'b11101001110111011010111010100101;
#10 input_rx=32'b11001100110111101110101000001101;
#10 input_rx=32'b11010101010101111011101100111011;
#10 input_rx=32'b10111101110110010101101100111011;
#10 rst=1;
#5  rst=0;
    input_rx=32'b10101011010101110110101101001101;
#10 input_rx=32'b10110101001011111010110101001101;
#10 input_rx=32'b10111110101001010011011010110101;
#10 input_rx=32'b00101001101011010101111101110101;
#10 input_rx=32'b00010111111101110101010011101001;
#10 input_rx=32'b01111010101010111011100011101001;
#10 input_rx=32'b00101010110110101011010111011101;

end


always
#5 clk=~clk;


endmodule
