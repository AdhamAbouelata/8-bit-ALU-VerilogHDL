//Adder
module adder(
           input [7:0] A,B,  				  // ALU 8-bit Inputs                 
           input [1:0] Adder_Sel,		  // ALU Selection
           output [7:0] Adder_Out, 		  // ALU 8-bit Output
			  output equal,greater,smaller, //comparison Flags
			  output CarryOut  				  // Carry Out Flag
    );

//internal signals
    reg [7:0] Adder_Result;
    wire [8:0] tmp;
	 //continous assignment
    assign Adder_Out = Adder_Result; // Adder out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
	 assign equal   = (A==B)?1'd1:1'd0 ;
	 assign greater = (A>B)	?1'd1:1'd0 ;
	 assign smaller = (A<B) ?1'd1:1'd0 ; 

	always@(*)
	begin
	case(Adder_Sel)
        2'b00: // Addition
           Adder_Result = A + B ; 
        2'b01: // Subtraction
           Adder_Result = A - B ;
        2'b11: // 2's compliment
           Adder_Result = ~B + 8'h01;
		  default: Adder_Result = 8'h00 ;
		  
        endcase  

	end
endmodule