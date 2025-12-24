`timescale 1ns / 1ps

module dual_priority_encoder_tb ();

  logic [11:0] req;
  logic [ 3:0] first;
  logic [ 3:0] second;

  dual_priority_encoder dut (
      .req(req),
      .first(first),
      .second(second)
  );

  initial begin
    $dumpfile("dual_priority_encoder.vcd");
    $dumpvars(0, dual_priority_encoder_tb);

    req = 12'b110000000000;
    #10;
    req = 12'b000000000011;
    #10;
  end

endmodule
