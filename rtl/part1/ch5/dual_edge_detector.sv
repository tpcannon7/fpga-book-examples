module dual_edge_detector (
    input logic clk,
    input logic rst,
    input logic in,

    output logic out
);

  typedef enum logic {
    zero,
    one
  } state_t;

  state_t current_state, next_state;

  always_ff @(posedge clk) begin
    if (rst) begin
      current_state <= zero;
    end else begin
      current_state <= next_state;
    end
  end

  always_comb begin
    next_state = current_state;
    out = 1'b0;
    case (current_state)
      zero: begin
        if (in) begin
          out = 1'b1;
          next_state = one;
        end else begin
          next_state = zero;
        end
      end
      one: begin
        if (in) begin
          next_state = one;
        end else begin
          out = 1'b1;
          next_state = zero;
        end
      end
      default: next_state = zero;
    endcase
  end

endmodule
