// Digital project: 8 bit ALU testbench structural
// Section 14 CND
 `timescale 1ns / 1ps  

module alu_struct_tb;
//Inputs
 reg[7:0] A,B;
 reg[3:0] ALU_Sel;
 reg clk,rst_n;
 reg [7:0] expected_result;
 reg [7:0] expected_bank [32:0];
 
 

//Outputs
 wire[7:0] ALU_Out;
 wire CarryOut;
 wire equal,smaller,greater;
 //wire [7:0] Adder1_Out, Logic1_Out, shifter1_Out, temp1, reg_In1;
 // Verilog code for ALU
 integer i =0;
 integer i1=0;
 integer i2=0;
 integer fails = 0;
 alu_struct test_unit(
				clk,rst_n,
            A,B,  // ALU 8-bit Inputs                 
            ALU_Sel,// ALU Selection
            ALU_Out, // ALU 8-bit Output
				equal,greater,smaller, //comparison Flags
            CarryOut // Carry Out Flag
     );
	  //Clock generation
		initial begin
			clk=1'b1;
			forever begin
				#5 clk = ~clk;
			end
		end
	initial begin	
    // hold reset state for 100 ns.
      A = 8'h14;
      B = 4'h04;
		rst_n = 1'b0;
		#20;
		ALU_Sel = 4'h0;
		#2;
		rst_n = 1'b1;
      
      #10;
      for (i=0;i<=30;i=i+1)
      begin
		 case(ALU_Sel)
        4'b0000: // Addition
           expected_bank[i] = A + B ; 
        4'b0001: // Subtraction
           expected_bank[i] = A - B ;
        4'b0011: // 2's compliment
           expected_bank[i] = ~B + 8'h01;
		  4'b0100: // Addition
           expected_bank[i] = A + B ; 
        4'b0101: // Subtraction
           expected_bank[i] = A - B ;
        4'b0111: // 2's compliment
           expected_bank[i] = ~B + 8'h01;	  
        4'b1000: //  Logical and 
           expected_bank[i] = A & B;
        4'b1001: //  Logical xor
           expected_bank[i] = A ^ B;
        4'b1010: //  Logical or 
           expected_bank[i] = A | B;
        4'b1011: //  Logical not
           expected_bank[i] = ~ B  ;
        4'b1100: // RIGHT SHIFT
           expected_bank[i] = A>>1;
        4'b1101: // LEFT SHIFT
           expected_bank[i] = A<<1;
        4'b1110: // RIGHT ROTATE
           expected_bank[i] = {A[0],A[7:1]};
        4'b1111: // LEFT ROTATE  
           expected_bank[i] = {A[6:0],A[7]};  
        default: expected_bank[i] = 8'h00 ;
		  
        endcase
		 if (i<30)begin 
			ALU_Sel = ALU_Sel + 8'h01;
		 end
       #10;
      end
      

		#250;
		
      
    end
	 //filling the expected bus with the expected bank after the 8 clk delay
initial begin

	 expected_result = 8'h0 ;
	 #100; // wait till output appear after the 8 clock cycles of the register
      for (i2=0;i2<=30;i2=i2+1)
      begin
			expected_result = expected_bank[i2];
			#10;
      end
	 
end
//stimulating the input
initial begin
	#20;//for the reset
	#3; //setup time
	#160;//16 clk cycles to cover all possible testcases
	A = 8'h0A;
   B = 8'hF6;
end

//self checking/comparing output to expected
initial begin
		#2;
    for (i1=0; i1<45; i1=i1+1) begin
		  $monitor ("[%0t] Expected = 0x%0h Actual = 0x%0h ", $time, expected_result, ALU_Out);
        if (expected_result != ALU_Out) begin
            fails = fails + 1;
            $display("test_failed", fails, "times");
        end
		  #10;
    end
	 if (fails == 1'b0)begin 
	 $display("test_passed");
	 end
	 $stop;
end 
endmodule
