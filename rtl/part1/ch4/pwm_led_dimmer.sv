`timescale 1ns / 1ps

module pwm_led_dimmer (
    input logic clk,
    input logic rst,
    input logic [3:0] w,

    output logic out
);

  logic [3:0] count_next, count_reg;
  logic pwm;
  logic pwm_next;

  always_ff @(posedge clk) begin
    if (rst) begin
      pwm <= 0;
      count_reg <= 0;
    end else begin
      pwm <= pwm_next;
      count_reg <= count_next;
    end
  end

  always @* begin
    if (count_reg < w) begin
      count_next = count_reg + 1;
      pwm_next   = 1;
    end else begin
      count_next = count_reg + 1;
      pwm_next   = 0;
    end
  end

  assign out = pwm;

endmodule
