`timescale 1ns / 1ps

module early_debouncer_tb ();

  logic clk, rst, in, out;

  early_debouncer uut (.*);

  always begin
    clk = 1'b1;
    #10;
    clk = 1'b0;
    #10;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, early_debouncer_tb);

    rst = 1'b1;
    in  = 1'b0;
    @(posedge clk);
    #20000000;
    rst = 1'b0;

    in  = 1'b1;

    @(posedge clk);
    #20000000;
    in = 1'b0;

    #20000000;

    $finish;

  end

endmodule
