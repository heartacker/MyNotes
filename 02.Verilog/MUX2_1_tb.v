`include "MUX2_1.v"

`timescale 1us/100ps

module testfixture;
  // Data type declaration
  reg a, b, sel;
  wire out;
  // MUX instance
  MUX2_1 mux (out, a, b,
              sel);

  /* iverilog */
  initial
  begin
    $dumpfile("testfixture.vcd"); //生成的vcd文件名称
    $dumpvars(0, testfixture);    //tb模块名称
  end
  /*iverilog */

  // Apply stimulus
  initial
  begin
    a = 0;
    b = 1;
    sel = 0;
    //! 这里更改了a
    #2 a = 0;
    #2 a = 1;
    //! 这里更改了b
    #2 b = 0;
    #2 b = 1;
    sel = 1;
    a = 0;

    //! 这里第二次更改了b
    #2 b = 0;
    #2 b = 1;

    #10 $display("===current simulation time %0f ===", $time);
    a = 1;
    #10 $display("===current simulation time %0f ===", $time);
    b = 0;
    a = 0;
    #20 $display("===current simulation time %0f ===", $time);
    $finish;

  end
  // Display results
endmodule
