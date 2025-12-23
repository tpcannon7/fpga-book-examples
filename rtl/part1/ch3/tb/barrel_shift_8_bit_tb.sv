`timescale 1ns / 1ps

module barrel_shift_8_bit_tb ();

  localparam SHIFT_BITS = 3;

  logic [7:0] in_;
  logic [2:0] sha_;
  logic lr_;

  logic [7:0] out_;
  integer i;

  barrel_shift_8_bit dut (
      .in (in_),
      .lr (lr_),
      .out(out_),
      .sha(sha_)
  );

  initial begin
    $dumpfile("barrel_shift.vcd");
    $dumpvars();

    lr_ = 0;
    in_ = 8'b10000001;

    for (i = 0; i < (SHIFT_BITS ** 2); i++) begin
      sha_ = i;
      #10;
    end

    lr_ = 1;
    in_ = 8'b10000001;

    for (i = 0; i < (SHIFT_BITS ** 2); i++) begin
      sha_ = i;
      #10;
    end

    $finish;

  end



endmodule
