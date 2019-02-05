`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2019 02:55:35 PM
// Design Name: 
// Module Name: arp_transm_tb
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


module arp_transm_tb(  );
reg [15:0] hdr_type;      
reg [15:0] proto_type;      
reg [7:0] hdr_addr_length;   
reg [7:0] pro_addr_length;
reg [15:0] operation;
reg [47:0] send_hdr_addr;   
reg [31:0] send_ip_addr;    
reg [47:0] target_hdr_addr; 
reg [31:0] target_ip_addr;  
reg clk;                    

wire [31:0] output_transmit; 

wire output_valid;  

wire input_hold;


arp_transm exa(hdr_type,proto_type,hdr_addr_length,pro_addr_length,send_hdr_addr,operation,send_ip_addr,target_hdr_addr,target_ip_addr,output_transmit,clk,output_valid,input_hold);


initial
begin
clk=0;

hdr_type=  16'b1001001100100101;
proto_type=16'b1111001100111101;
hdr_addr_length = 8'b00001000;
pro_addr_length = 8'b00001000;
operation = 16'b0000000000000001;
send_hdr_addr=48'b111100101010110110010011001001011110011001111011;
send_ip_addr=32'b11110101010111111101010101111101;
target_ip_addr=32'b11010101011110101010111111110111;
target_hdr_addr=48'b111100100101100110010010110110111111100110010011;


#30
hdr_type=  16'b1010010010011001;
proto_type=16'b1111100111100101;
send_hdr_addr=48'b111111001010101101100100100100100101111001111011;
send_ip_addr=32'b11111101010101111010101011111101;
target_ip_addr=32'b11010101011111110101011110110111;
target_hdr_addr=48'b111010110110001001011111110011100110010110010011;






end


always
#5 clk=~clk;


endmodule

