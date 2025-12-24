`timescale 1ns / 1ps

module parameterized_barrel_shift_tb ();

  localparam N = 4;
  localparam NUM_BITS = 2 ** N;

  logic [NUM_BITS-1:0] in;
  logic [NUM_BITS-1:0] out;
  logic [N-1:0] shift_amount;
  integer i;

  parameterized_barrel_shifter dut (
      .in(in),
      .out(out),
      .shift_amount(shift_amount)
  );

  initial begin
    $dumpfile("parameterized_barrel_shift.vcd");
    $dumpvars(0, parameterized_barrel_shift_tb);

    in = 16'b1000000000000001;
    for (i = 0; i < N ** 2; i++) begin
      shift_amount = i;
      #10;
    end
    $finish;
  end

endmodule
