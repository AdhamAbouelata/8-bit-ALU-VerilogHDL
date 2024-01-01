// Digital project: 8 bit ALU testbench
// Section 14 CND
 `timescale 1ns / 1ps  

module adder_tb;
//Inputs
 reg[7:0] A,B;
 reg[1:0] Adder_Sel;

//Outputs
 wire[7:0] Adder_Out;
 wire CarryOut;
 wire equal,smaller,greater;
 // Verilog code for adder
 integer i=0;
 adder test_unit(
            A,B,  // ALU 8-bit Inputs                 
            Adder_Sel,// ALU Selection
            Adder_Out, // ALU 8-bit Output
				equal,greater,smaller, //comparison Flags
            CarryOut // Carry Out Flag
     );
    initial begin
    // hold reset state for 100 ns.
      A = 8'h0A;
      B = 8'h02;
      Adder_Sel = 2'h0;
      #10;
      for (i=0;i<=3;i=i+1)
      begin
       Adder_Sel = Adder_Sel + 2'h1;
       #10;
      end
      
      A = 8'hF6;
      B = 8'h0A;
      
    end
endmodule