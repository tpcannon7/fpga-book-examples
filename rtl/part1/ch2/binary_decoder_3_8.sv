`default_nettype none

module binary_decoder_3_8 (
    input logic [2:0] in,
    input logic en,

    output logic [7:0] out
);

  logic [1:0] in1to0;
  logic en1, en2;
  logic [3:0] out3to0;
  logic [3:0] out7to4;

  assign in1to0 = in[1:0];

  assign en1 = ~in[2] & en;
  assign en2 = in[2] & en;

  assign out[3:0] = out3to0;
  assign out[7:4] = out7to4;

  binary_decoder_2_4 dut1 (
      .in (in1to0),
      .en (en1),
      .out(out3to0)
  );

  binary_decoder_2_4 dut2 (
      .in (in1to0),
      .en (en2),
      .out(out7to4)
  );

endmodule
