`timescale 1ns / 1ps

module binary_decoder_4_16_tb ();

  localparam int IN_BITS = 4;

  logic [3:0] in_;
  logic en;

  logic [15:0] out;

  integer i;

  binary_decoder_4_16 dut (
      .in (in_),
      .en (en),
      .out(out)
  );

  initial begin
    $dumpfile("binary_decoder_4_16.vcd");
    $dumpvars();

    en = 1;
    for (i = 0; i < 1 << IN_BITS; i++) begin
      in_ = i;
      #10;
    end

    en = 0;
    for (i = 0; i < 1 << IN_BITS; i++) begin
      in_ = i;
      #10;
    end
    $finish;
  end


endmodule
