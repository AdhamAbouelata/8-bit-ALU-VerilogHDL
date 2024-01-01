module register_8bit (clk, rst, d, q);
input clk, rst;
input  [7:0] d; 
output [7:0] q;

wire [7:0] q1, q2, q3, q4, q5, q6, q7;

d_ffr u1(clk, rst, d, q1);
d_ffr u2(clk, rst, q1, q2);
d_ffr u3(clk, rst, q2, q3);
d_ffr u4(clk, rst, q3, q4);
d_ffr u5(clk, rst, q4, q5);
d_ffr u6(clk, rst, q5, q6);
d_ffr u7(clk, rst, q6, q7);
d_ffr u8(clk, rst, q7, q);


endmodule