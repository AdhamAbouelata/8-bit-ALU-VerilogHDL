// Digital project: 8 bit ALU testbench
// Section 14 CND
 `timescale 1ns / 1ps  

module logic_tb;
//Inputs
 reg[7:0] A,B;
 reg[1:0] Logic_Sel;

//Outputs
 wire[7:0] Logic_Out;

 // Verilog code for adder
 integer i=0;
 logic_unit test_unit(
            A,B,  // ALU 8-bit Inputs                 
            Logic_Sel,// ALU Selection
            Logic_Out // ALU 8-bit Output
     );
    initial begin
    // hold reset state for 100 ns.
      A = 8'h0A;
      B = 4'h02;
      Logic_Sel = 2'h0;
      #10;
      for (i=0;i<=3;i=i+1)
      begin
       Logic_Sel = Logic_Sel + 2'h1;
       #10;
      end
      
      A = 8'hF6;
      B = 8'h0A;
      
    end
endmodule