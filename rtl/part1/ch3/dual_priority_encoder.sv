`timescale 1ns / 1ps

module dual_priority_encoder (
    input  logic [11:0] req,
    output logic [ 3:0] first,
    output logic [ 3:0] second
);

  localparam INPUT_BITS = 12;

  logic [3:0] temp1;
  logic [3:0] temp2;

  always_comb begin
    temp1 = 4'bxxxx;
    temp2 = 4'bxxxx;
    for (int i = 0; i < INPUT_BITS; i++) begin
      if (req[i]) begin
        temp2 = temp1;
        temp1 = i;
      end
    end
  end

  assign first  = temp1;
  assign second = temp2;

endmodule
