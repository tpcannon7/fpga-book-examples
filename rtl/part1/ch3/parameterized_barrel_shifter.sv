`timescale 1ns / 1ps

module parameterized_barrel_shifter #(
    parameter N = 4
) (
    input logic [(2**N)-1:0] in,
    input logic [N-1:0] shift_amount,
    output logic [(2**N)-1:0] out
);

  // only shifts left

  localparam NUM_BITS = 2 ** N;

  logic [NUM_BITS-1:0] stage[0:N];
  genvar i;

  assign stage[0] = in;

  generate
    for (i = 0; i < N; i = i + 1) begin : g_shift_stage
      localparam BITS_SHIFTED = 2 ** i;

      assign stage[i+1] = shift_amount[i] ?
                        {stage[i][BITS_SHIFTED-1:0], stage[i][NUM_BITS-1:NUM_BITS-BITS_SHIFTED]}
                        : stage[i];
    end
  endgenerate
  assign out = stage[N];
endmodule
