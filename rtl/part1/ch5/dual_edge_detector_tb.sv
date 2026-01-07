`timescale 1ns / 1ps

module dual_edge_detector_tb ();

  logic clk, rst, in, out;

  dual_edge_detector uut (.*);

  always begin
    clk = 1'b1;
    #10;
    clk = 1'b0;
    #10;
  end


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, dual_edge_detector_tb);

    rst = 1'b1;
    in  = 1'b0;
    @(posedge clk);
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    in = 1'b1;
    @(posedge clk);
    @(posedge clk);

    @(posedge clk);
    in = 1'b0;
    @(posedge clk);
    @(posedge clk);

    @(posedge clk);
    in = 1'b1;
    @(posedge clk);
    in = 1'b0;

    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    $finish;
  end

endmodule
