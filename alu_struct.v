// Digital project: 8 bit ALU STRUCTURAL 
// Section 14 CND 
module alu_struct(
           input clk, rst_n,
			  input [7:0] A,B,  				  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,			  // ALU Selection
           output [7:0] ALU_Out, 		  // ALU 8-bit Output
			  output equal,greater,smaller, //comparison Flags
			  output CarryOut  				  // Carry Out Flag
    );
	 
//internal signals
wire [7:0] Adder_Out, Logic_Out, shifter_Out, temp, reg_In;
 
adder 			g1(A, B, ALU_Sel[1:0], Adder_Out, equal, greater, smaller, CarryOut);
logic_unit		g2(A, B, ALU_Sel[1:0], Logic_Out);
shifter			g3(A,    ALU_Sel[1:0], shifter_Out);
mux_8bit			g4(temp  , 		Logic_Out, shifter_Out, ALU_Sel[2]);
mux_8bit			g5(reg_In,     Adder_Out, temp       , ALU_Sel[3]);
register_8bit	g6(clk, rst_n, reg_In, ALU_Out);

endmodule