`timescale 1ns / 1ps

module binary_decoder_2_4_tb ();

  localparam int IN_BITS = 2;

  reg [1:0] in;
  reg en;

  wire [3:0] out;

  integer i;

  binary_decoder_2_4 dut (
      .in (in),
      .en (en),
      .out(out)
  );

  initial begin
    $dumpfile("binary_decoder_2_4.vcd");
    $dumpvars();

    en = 1;

    for (i = 0; i < IN_BITS ** 2; i++) begin
      in = i;
      #10;
    end

    en = 0;

    for (i = 0; i < IN_BITS ** 2; i++) begin
      in = i;
      #10;
    end
    $finish;
  end


endmodule
