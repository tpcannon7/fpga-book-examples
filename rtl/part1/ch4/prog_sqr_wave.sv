// 10ns clock
// m * 100ns for high
// n * 100ns for low

`timescale 1ns / 1ps

module prog_sqr_wave (
    input logic clk,
    input logic rst,
    input logic [3:0] m,
    input logic [3:0] n,

    output logic out
);

  logic [11:0] count_reg, count_next, total_period, high_duration;

  assign high_duration = m * 10;
  assign total_period  = (m + n) * 10;

  always_ff @(posedge clk) begin
    if (rst) begin
      count_reg <= 0;
    end else begin
      count_reg <= count_next;
    end
  end

  assign count_next = (count_reg >= total_period - 1) ? 0 : count_reg + 1;

  assign out = (count_reg < high_duration);

endmodule
