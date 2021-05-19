
`include "multiplier.v"

`timescale 1ns / 1ps

// TestBench
// fpga4student.com FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for multiplier
module test();
  //* signals
  reg start,reset;
  reg[3:0] A,B;

  //* Outputs
  wire [7:0] O;
  wire Finish;

  //^ 当finish的上升沿触发的停止start
  always @(negedge Finish)
    start = 0;

  //* device under test
  mult_4x4 dut(reset,start, A,B,O,Finish);

  //? iverilog
  initial
  begin
    $dumpfile("test.vcd"); //生成的vcd文件名称
    $dumpvars(0, test);    //tb模块名称
  end
  // iverilog

  initial
  begin
    reset=1; // reset
    #40 start = 0;
    A = 14;
    B = 11;

    #40 reset = 0;
    start = 1; // start
    //start = 0;
    #500
     $display("%d * %d = %d",A,B,O);
    $stop;
  end
endmodule
