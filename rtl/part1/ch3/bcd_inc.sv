// increments bcd

module bcd_inc (
    input  logic [11:0] bcd,
    output logic [11:0] inc_bcd
);

  logic [3:0] bottom;
  logic [3:0] middle;
  logic [3:0] top;

  logic overflow_bottom;
  logic overflow_middle;

  always @* begin
    bottom = bcd[3:0];
    middle = bcd[7:4];
    top = bcd[11:8];

    overflow_bottom = 1'b0;
    overflow_middle = 1'b0;

    if (bottom == 4'b1001) begin
      bottom = 4'b0000;
      overflow_bottom = 1'b1;
    end else begin
      bottom += 1;
    end

    if (overflow_bottom && middle == 4'b1001) begin
      middle = 4'b0000;
      overflow_middle = 1'b1;
    end else begin
      middle += overflow_bottom;
    end

    if (overflow_middle && top == 4'b1001) begin
      top = 4'b0000;
    end else begin
      top += overflow_middle;
    end

  end

  assign inc_bcd = {top, middle, bottom};

endmodule
