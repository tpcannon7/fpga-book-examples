module int_fp_conversion (
    input logic signed [7:0] signed_int,
    output logic [12:0] fp
);

  logic sign;
  logic [3:0] exponent;
  logic [7:0] mantissa;

  logic [7:0] magnitude;
  logic [2:0] norm_pos;

  always_comb begin
    sign = signed_int[7];

    if (sign) begin
      magnitude = ~signed_int + 1'b1;
    end else begin
      magnitude = signed_int;
    end

    casex (magnitude)
      8'b1xxxxxxx: norm_pos = 3'd7;
      8'b01xxxxxx: norm_pos = 3'd6;
      8'b001xxxxx: norm_pos = 3'd5;
      8'b0001xxxx: norm_pos = 3'd4;
      8'b00001xxx: norm_pos = 3'd3;
      8'b000001xx: norm_pos = 3'd2;
      8'b0000001x: norm_pos = 3'd1;
      8'b00000001: norm_pos = 3'd0;
      default: norm_pos = 3'd0;
    endcase

    mantissa = magnitude << 4'd8 - norm_pos;
    exponent = norm_pos + 4'd7;

    if (signed_int == 8'b00000000) begin
      fp = 13'b0000000000000;
    end else begin
      fp = {sign, exponent, mantissa};
    end

  end

endmodule
