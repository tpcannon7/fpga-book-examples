`timescale 1ns / 1ps


module int_fp_conversion_tb ();

  logic signed [7:0] signed_int;
  logic [12:0] fp;

  int_fp_conversion dut (
      .fp(fp),
      .signed_int(signed_int)
  );

  initial begin
    $dumpfile("int_fp.vcd");
    $dumpvars(0, int_fp_conversion_tb);

    signed_int = 8'b11111100;

    #10;

    signed_int = 8'b11110101;

    #10;

  end


endmodule
