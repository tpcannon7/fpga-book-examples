`timescale 1ns / 1ps

module bcd_inc_tb ();

  logic [11:0] bcd;
  logic [11:0] inc_bcd;

  bcd_inc dut (
      .bcd(bcd),
      .inc_bcd(inc_bcd)
  );

  initial begin
    $dumpfile("bcd_inc.vcd");
    $dumpvars(0, bcd_inc_tb);

    bcd = 12'b001001011001;
    #10;
    bcd = 12'b000010011001;
    #10;
    bcd = 12'b100110011001;
    #10;

  end

endmodule
