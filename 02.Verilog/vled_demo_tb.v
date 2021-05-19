
`include "vled_demo.v"

`timescale 1ns/100ps



module vled_demo_tb;

  parameter SYSCLK_PERIOD = 10;

  reg SYSCLK;
  reg NSYSRESET;

  initial
  begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
  end

  /* iverilog */
  initial
  begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars(0, vled_demo_tb);    //tb模块名称
  end
  /*iverilog */

  initial
  begin
    #(SYSCLK_PERIOD * 10 )
     NSYSRESET = 1'b1;
    #1000
     $stop;
  end

  //! fsm_extract
  always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;

  //! 引用一个模块，并传入参数
  vled_demo led_demo_ut0 (
              // Inputs
              .rst_n(NSYSRESET),

              .clk(SYSCLK),

              // Outputs
              .led( led)
            );

endmodule
