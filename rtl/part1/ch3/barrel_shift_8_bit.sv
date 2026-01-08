`timescale 1ns / 1ps

module barrel_shift_8_bit (
    input logic [7:0] in,
    input logic lr,
    input logic [2:0] sha,
    output logic [7:0] out
);
  logic [7:0] shift_right;
  logic [7:0] shift_left;

  always_comb begin
    // right shift circuit
    case (sha)
      3'b000:  shift_right = in;
      3'b001:  shift_right = {in[0], in[7:1]};
      3'b010:  shift_right = {in[1:0], in[7:2]};
      3'b011:  shift_right = {in[2:0], in[7:3]};
      3'b100:  shift_right = {in[3:0], in[7:4]};
      3'b101:  shift_right = {in[4:0], in[7:5]};
      3'b110:  shift_right = {in[5:0], in[7:6]};
      3'b111:  shift_right = {in[6:0], in[7]};
      default: shift_right = 'x;
    endcase

    // left shift circuit
    case (sha)
      3'b000:  shift_left = in;
      3'b001:  shift_left = {in[6:0], in[7]};
      3'b010:  shift_left = {in[5:0], in[7:6]};
      3'b011:  shift_left = {in[4:0], in[7:5]};
      3'b100:  shift_left = {in[3:0], in[7:4]};
      3'b101:  shift_left = {in[2:0], in[7:3]};
      3'b110:  shift_left = {in[1:0], in[7:2]};
      3'b111:  shift_left = {in[0], in[7:1]};
      default: shift_left = 'x;
    endcase

    case (lr)
      1'b0: out = shift_left;
      1'b1: out = shift_right;
      default: out = 'x;
    endcase
  end

endmodule
