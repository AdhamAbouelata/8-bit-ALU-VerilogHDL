//Adder
module logic_unit(
           input [7:0] A,B,  				  // ALU 8-bit Inputs                 
           input [1:0] Logic_Sel,		  // ALU Selection
           output [7:0] Logic_Out 		  // ALU 8-bit Output
    );

//internal signals
    reg  [7:0] Logic_Result;
	 //continous assignment
    assign Logic_Out = Logic_Result; // Logic out 

	always@(*)
	begin
	case(Logic_Sel)
        2'b00: //  Logical and 
           Logic_Result = A & B;
        2'b01: //  Logical xor
           Logic_Result = A ^ B;
        2'b10: //  Logical or 
           Logic_Result = A | B;
        2'b11: //  Logical not
           Logic_Result = ~ B  ;
		  default: Logic_Result = 8'h00 ;
		  
   endcase  

	end
endmodule