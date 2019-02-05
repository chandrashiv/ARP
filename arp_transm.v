`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2019 04:24:43 PM
// Design Name: 
// Module Name: arp_transm
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


module arp_transm(hdw_lenth,pro_lenth,operation,hdr_type,proto_type,send_hdr_addr,send_ip_addr,target_hdr_addr,target_ip_addr,output_transmit,clk,output_ackw,input_hold);
input [15:0] hdr_type;        //hardware type
input [15:0] proto_type;      //protocol type
input [47:0] send_hdr_addr;   //sender mac address
input [31:0] send_ip_addr;    //sender ip address
input [47:0] target_hdr_addr; //target mac address
input [31:0] target_ip_addr;
input [7:0] hdw_lenth;
input [15:8] pro_lenth;
input [31:0] operation;//target ip address
input clk;                    //clock

output reg [31:0] output_transmit; //transmitted output 

output reg output_ackw=1;  //output is transmitted

output reg input_hold=0;

 reg [31:0] M0;
 reg [31:0] M1;
 reg [31:0] M2;
 reg [31:0] M3;
 reg [31:0] M4;
 reg [31:0] M5;
 reg [31:0] M6;
 
 parameter s0=3'b000;
 parameter s1=3'b001;
 parameter s2=3'b010;
 parameter s3=3'b011;
 parameter s4=3'b100;
 parameter s5=3'b101;
 parameter s6=3'b110;
 
reg [2:0]state;
reg [2:0]next_state=s0;




always@(posedge clk & output_ackw)
begin
   /*storing the input into temporary registers before transferring to the output*/
  M0 <= {hdr_type,proto_type};
  M1 <={hdw_lenth,pro_lenth,operation};
  M2 <= send_hdr_addr[47:16];
  M3 <= {send_hdr_addr[15:0],send_ip_addr[31:16]};
  M4 <= {send_ip_addr[15:0],target_hdr_addr[47:32]};
  M5 <= target_hdr_addr[31:0];
  M6 <= target_ip_addr;
  output_ackw<=0;
  
 end
    
    


   
always@(posedge clk)
begin
state<=next_state;
end   

always@(state)
begin
case(state)
s0 : begin 
     next_state<=s1;
     output_transmit<=M0;
     input_hold<=1;
     end
s1 : begin
     next_state<=s2;
     output_transmit<=M1;
     end     
s2 : begin
     next_state<=s3;
     output_transmit<=M2;
     end
s3 : begin 
     next_state<=s4;
     output_transmit<=M3;
     end
s4 : begin 
     next_state<=s5;
     output_transmit<=M4;
     end
s5 : begin 
     next_state<=s6;
     output_transmit<=M5;
     end
 s6 : begin 
          next_state<=s0;
          output_transmit<=M6;
          output_ackw<=1;
          input_hold<=0;
          end   
default : next_state<=s0;

endcase




end



    
endmodule


