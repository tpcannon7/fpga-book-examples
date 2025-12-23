`timescale 1ns / 1ps

module binary_decoder_3_8_tb ();

  localparam int IN_BITS = 3;

  reg [2:0] in;
  reg en;

  wire [7:0] out;

  integer i;

  binary_decoder_3_8 dut (
      .in (in),
      .en (en),
      .out(out)
  );

  initial begin
    $dumpfile("binary_decoder_3_8.vcd");
    $dumpvars;

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
