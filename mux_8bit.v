//MUX code
module mux_8bit(Out, In0, In1, S);

output [7:0] Out;
input  [7:0] In0, In1;
input  S;

assign Out = (S) ? In1:In0 ;

endmodule