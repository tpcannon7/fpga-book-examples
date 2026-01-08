// 1 sign bit, 4 exp bits, 8 mantissa bits
// assert gt if fp1 > fp2

module fp_greater_than (
    input logic [12:0] fp1,
    input logic [12:0] fp2,
    output logic gt
);
  logic sign1, sign2;
  logic [3:0] exp1, exp2;
  logic [7:0] mant1, mant2;


  always_comb begin
    sign1 = fp1[12];
    sign2 = fp2[12];

    exp1 = fp1[11:8];
    exp2 = fp2[11:8];

    mant1 = fp1[7:0];
    mant2 = fp2[7:0];

    gt = 1'b0;

    if (sign1 < sign2) begin
      gt = 1'b1;
    end else if (sign1 == sign2 && sign1 == 1'b0) begin
      if (exp1 > exp2) begin
        gt = 1'b1;
      end else if (exp1 == exp2) begin
        gt = mant1 > mant2 ? 1'b1 : 1'b0;
      end
    end else if (sign1 == sign2 && sign1 == 1'b1) begin
      if (exp1 < exp2) begin
        gt = 1'b1;
      end else if (exp1 == exp2) begin
        gt = mant1 < mant2 ? 1'b1 : 1'b0;
      end
    end
  end
endmodule
