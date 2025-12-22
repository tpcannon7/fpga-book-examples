module greater_than (
    input logic [3:0] a,
    input logic [3:0] b,

    output logic o
);

  logic p1, p2;

  assign o = p1 | p2;

  assign p1 = (a[0] & ~b[1] & ~b[0]) | (a[1] & ~b[1] & b[0]) | 
              (a[1] & a[0] & ~b[0]) | (a[1] & ~a[0] & ~b[1] & ~b[0]);
  assign p2 = (a[2] & ~b[3] & ~b[2]) | (a[3] & ~b[3] & b[2]) | (a[3] & a[2] & ~b[2])
  | (a[3] & ~a[2] & ~b[3] & ~b[2]);

  // #lol my kmap simplified wrong

endmodule
