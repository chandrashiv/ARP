`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2019 04:16:51 PM
// Design Name: 
// Module Name: ARP_rx
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


module ARP_rx(input_rx,hdr_type,proto_type,hdr_addr_length,pro_addr_length,operation,send_hdr_addr,send_ip_addr,target_hdr_addr,target_ip_addr,clk,rst,input_ackw);
input [31:0]input_rx;
output reg [15:0] hdr_type;
output reg [15:0] proto_type;
output reg [7:0] hdr_addr_length;
output reg [7:0] pro_addr_length;
output reg [15:0] operation;
output reg [47:0] send_hdr_addr;
output reg [31:0] send_ip_addr;
output reg [47:0] target_hdr_addr;
output reg [31:0] target_ip_addr;
input clk;
input rst;
output reg input_ackw=0; //input recieved


 reg [31:0] M0=0;
 reg [31:0] M1=0;
 reg [31:0] M2=0;
 reg [31:0] M3=0;
 reg [31:0] M4=0;
 reg [31:0] M5=0;
 reg [31:0] M6=0;
    
    
 parameter s0=3'b000;
 parameter s1=3'b001;
 parameter s2=3'b010;
 parameter s3=3'b011;
 parameter s4=3'b100;
 parameter s5=3'b101;
 parameter s6=3'b110;
 
 
reg [2:0]state;
reg [2:0]next_state=s0;

always@(posedge clk)
begin
state<=next_state;
end  

always@(state)
begin
case(state)
s0 : begin 
     next_state<=s1;
     M0<=input_rx;
     input_ackw<=0;
     end
s1 : begin
     next_state<=s2;
     M1<=input_rx;
     end     
s2 : begin
     next_state<=s3;
     M2<=input_rx;
     end
s3 : begin 
     next_state<=s4;
     M3<=input_rx;
     end
s4 : begin 
     next_state<=s5;
     M4<=input_rx;
     end
s5 : begin 
     next_state<=s6;
     M5<=input_rx;
     end
s6 : begin 
     next_state<=s0;
     M6<=input_rx;
     input_ackw<=1;
     end
default : next_state<=s0;

endcase

end

always@(posedge clk)
begin
if(rst)
begin
hdr_type<=0;
proto_type<=0;
send_hdr_addr<=0;
hdr_addr_length<=0;
pro_addr_length<=0;
operation<=0;
send_ip_addr<=0;
target_hdr_addr<=0;
target_ip_addr<=0;
end


else
begin
hdr_type=M0[31:16];
proto_type<=M0[15:0];
hdr_addr_length<=M1[31:24];
pro_addr_length<=M1[23:16];
operation<=M1[15:0];
send_hdr_addr<={M2,M3[31:16]};
send_ip_addr<={M3[15:0],M4[31:16]};
target_hdr_addr<={M4[15:0],M5};
target_ip_addr<=M6;
end


end
endmodule








    


