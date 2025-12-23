`default_nettype none

module binary_decoder_4_16 (
    input logic [3:0] in,
    input logic en,

    output logic [15:0] out
);

  logic [7:0] out15to8;
  logic [7:0] out7to0;
  logic [2:0] in2to0;

  assign in2to0 = in[2:0];
  assign out[15:8] = out15to8;
  assign out[7:0] = out7to0;

  binary_decoder_3_8 low_decoder (
      .in (in2to0),
      .en (~in[3] & en),
      .out(out7to0)
  );
  binary_decoder_3_8 high_decoder (
      .in (in2to0),
      .en (in[3] & en),
      .out(out15to8)
  );

endmodule
