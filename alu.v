// Digital project: 8 bit ALU BEHAVIORAL
// Section 14 CND 
module alu(
           input [7:0] A,B,  				  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,			  // ALU Selection
           output [7:0] ALU_Out, 		  // ALU 8-bit Output
			  output equal,greater,smaller, //comparison Flags
			  output CarryOut  				  // Carry Out Flag
    );
	 //internal signals
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
	 //continous assignment
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
	 assign equal   = (A==B)?1'd1:1'd0 ;
	 assign greater = (A>B)	?1'd1:1'd0 ;
	 assign smaller = (A<B) ?1'd1:1'd0 ; 
	 
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
        4'b0011: // 2's compliment
           ALU_Result = ~B + 8'h01;
		  4'b0100: // Addition
           ALU_Result = A + B ; 
        4'b0101: // Subtraction
           ALU_Result = A - B ;
        4'b0111: // 2's compliment
           ALU_Result = ~B + 8'h01;	  
        4'b1000: //  Logical and 
           ALU_Result = A & B;
        4'b1001: //  Logical xor
           ALU_Result = A ^ B;
        4'b1010: //  Logical or 
           ALU_Result = A | B;
        4'b1011: //  Logical not
           ALU_Result = ~ B  ;
        4'b1100: // RIGHT SHIFT
           ALU_Result = A>>1;
        4'b1101: // LEFT SHIFT
           ALU_Result = A<<1;
        4'b1110: // RIGHT ROTATE
           ALU_Result = {A[0],A[7:1]};
        4'b1111: // LEFT ROTATE  
           ALU_Result = {A[6:0],A[7]};  
        default: ALU_Result = 8'h00 ;
		  
        endcase
    end

endmodule