`timescale 1ns / 1ps

module pwm_led_dimmer_tb ();

  localparam int T = 10;

  logic clk, rst;
  logic [3:0] w;

  logic out;

  pwm_led_dimmer uut (.*);


  always begin
    clk = 1'b1;
    #T;
    clk = 1'b0;
    #10;
  end

  initial begin
    $dumpfile("pwm.vcd");
    $dumpvars(0, pwm_led_dimmer_tb);

    rst = 1'b1;
    #T;
    rst = 1'b0;

    w   = 4'b0010;

    #1000;

    $finish;
  end

endmodule
