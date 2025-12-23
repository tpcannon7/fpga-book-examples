`timescale 1ns / 1ps

module greater_than_tb ();

  localparam NUM_BITS = 4;

  reg [NUM_BITS-1:0] a;
  reg [NUM_BITS-1:0] b;
  wire o;

  integer i;
  integer j;

  greater_than dut (
      .a(a),
      .b(b),
      .o(o)
  );

  initial begin
    $dumpfile("greater_than.vcd");
    $dumpvars();
    for (i = 0; i < NUM_BITS ** 2; i++) begin
      for (j = 0; j < NUM_BITS ** 2; j++) begin
        a = i;
        b = j;
        #10;
      end
    end
    $finish;
  end

endmodule
