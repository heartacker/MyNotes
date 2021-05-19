module vled_demo(
    input clk,   //! 时钟
    input rst_n, //! reset

    output reg led
  );

  reg [7:0] cnt; //! 计时器
  // 你看这里对齐很不好i
  always @ (posedge clk)
  begin
    if(!rst_n)
      cnt <= 0;
    else if(cnt >= 10)
      cnt <= 0;
    else
      cnt <= cnt + 1;
  end

  always @ (posedge clk)
  begin
    if(!rst_n)
      led <= 0;
    else if(cnt == 10)
      led <= !led;
  end

endmodule
