module d_ffr(clk, rst_n, d, q);
input clk, rst_n;
input  [7:0] d;
output reg [7:0] q;
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) q <= 0;
    else      q <= d;
end
endmodule