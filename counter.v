//ripple counter
`timescale 1ns/100ps
 module ripple_counter_4bit(A,count,reset);
 output [3:0]A;
 input count,reset;
 //instantiate comp flip-flop
 comp_flip_flop f0(A[0],count,reset);
 comp_flip_flop f1(A[1],A[0],reset);
 comp_flip_flop f2(A[2],A[1],reset);
 comp_flip_flop f3(A[3],A[2],reset);
 endmodule
 //comp flip-flop
 module comp_flip_flop (q,clk,reset);
 output reg q=1'b0;

 input clk,reset;

 always @ (negedge clk,posedge reset)
 begin
 if(reset) q<=0;
 else q<= ~q;
 end
 endmodule
