`timescale 1ns / 1ps

module parking_lot_occupancy_tb ();

  logic clk, rst, a, b, car_enter, car_exit;

  parking_lot_occupancy uut (.*);

  always begin
    clk = 1'b1;
    #10;
    clk = 1'b0;
    #10;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, parking_lot_occupancy_tb);

    rst = 1'b1;
    a   = 1'b0;
    b   = 1'b0;
    @(posedge clk);
    @(posedge clk);
    rst = 1'b0;

    a   = 1'b1;
    @(posedge clk);
    @(posedge clk);
    b = 1'b1;
    @(posedge clk);
    a = 1'b0;

    @(posedge clk);

    b = 1'b1;
    @(posedge clk);
    @(posedge clk);
    b = 1'b0;

    @(posedge clk);
    @(posedge clk);
    $finish;
  end


endmodule
