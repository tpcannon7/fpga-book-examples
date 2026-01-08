module early_debouncer (
    input  logic clk,
    input  logic rst,
    input  logic in,
    output logic out
);

  localparam int N = 18;

  typedef enum {
    s_zero,
    s_wait,
    s_one
  } state_t;

  state_t current_state, next_state;

  logic [N-1:0] current_count, next_count;

  logic ms_ticks;

  assign ms_tick = (current_count == 0) ? 1'b1 : 1'b0;
  assign next_count = current_count + 1;

  always_ff @(posedge clk) begin
    if (rst) begin
      current_count <= 0;
      current_state <= s_zero;
    end else begin
      current_count <= next_count;
      current_state <= next_state;
    end
  end

  always_comb begin
    next_state = current_state;
    out = 1'b0;

    case (current_state)
      s_zero: begin
        if (in) begin
          next_state = s_wait;
        end else begin
          next_state = s_zero;
        end
      end
      s_wait: begin
        out = 1'b1;
        if (ms_tick && in) begin
          next_state = s_one;
        end else begin
          next_state = s_wait;
        end
      end
      s_one: begin
        out = 1'b1;
        if (!in) begin
          next_state = s_zero;
        end else begin
          next_state = s_one;
        end
      end
      default: next_state = s_zero;
    endcase
  end
endmodule
