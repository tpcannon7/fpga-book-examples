`timescale 1ns / 1ps

module prog_sqr_wave_tb ();

  localparam int T = 10;

  logic [3:0] m, n;
  logic clk;
  logic rst;

  logic out;

  prog_sqr_wave uut (.*);

  always begin
    clk = 1'b1;
    #(T / 2);
    clk = 1'b0;
    #(T / 2);
  end

  initial begin
    $dumpfile("sqr.vcd");
    $dumpvars(0, prog_sqr_wave_tb);


    rst = 1'b1;
    #(T);
    rst = 1'b0;

    m   = 4'b0001;
    n   = 4'b0010;

    #1000;

    $finish;
  end


endmodule
