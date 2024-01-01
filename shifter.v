//Shifter
module shifter(
           input [7:0] A,  				  // ALU 8-bit Inputs                 
           input [1:0] shifter_Sel,		  // ALU Selection
           output [7:0] shifter_Out 		  // ALU 8-bit Output
    );

//internal signals
    reg  [7:0] shifter_Result;
	 //continous assignment
    assign shifter_Out = shifter_Result; // Logic out 

	always@(*)
	begin
	case(shifter_Sel)
        2'b00: // RIGHT SHIFT
           shifter_Result = A>>1;
        2'b01: // LEFT SHIFT
           shifter_Result = A<<1;
        2'b10: // RIGHT ROTATE
           shifter_Result = {A[0],A[7:1]};
        2'b11: // LEFT ROTATE  
           shifter_Result = {A[6:0],A[7]};
		  default: shifter_Result = 8'h00 ;
		  
   endcase  

	end
endmodule