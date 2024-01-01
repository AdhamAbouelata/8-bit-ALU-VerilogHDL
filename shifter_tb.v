// Digital project: 8 bit ALU testbench
// Section 14 CND
 `timescale 1ns / 1ps  

module shifter_tb;
//Inputs
 reg[7:0] A;
 reg[1:0] shifter_Sel;

//Outputs
 wire[7:0] shifter_Out;

 // Verilog code for adder
 integer i=0;
 shifter test_unit(
            A,  // ALU 8-bit Inputs                 
            shifter_Sel,// ALU Selection
            shifter_Out // ALU 8-bit Output
     );
    initial begin
    // hold reset state for 100 ns.
      A = 8'h0A;
      shifter_Sel = 2'h0;
      #10;
      for (i=0;i<=3;i=i+1)
      begin
       shifter_Sel = shifter_Sel + 2'h1;
       #10;
      end
      
      A = 8'hF6;

      
    end
endmodule