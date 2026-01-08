module parking_lot_occupancy (
    input logic clk,
    input logic rst,
    input logic a,
    input logic b,

    output logic car_enter,
    output logic car_exit
);

  typedef enum {
    no_car,
    car_a,
    car_b
  } state_t;

  state_t current_state, next_state;

  logic [2:0] current_count, next_count;

  always_ff @(posedge clk) begin
    if (rst) begin
      current_state <= no_car;
    end else begin
      current_state <= next_state;
    end
  end

  always_ff @(posedge clk) begin
    if (rst) begin
      current_count <= 0;
    end else begin
      if (car_enter) begin
        current_count <= next_count + 1'b1;
      end else if (car_exit) begin
        current_count <= next_count - 1'b1;
      end
    end
  end

  always_comb begin
    next_state = current_state;
    car_enter  = 1'b0;
    car_exit   = 1'b0;
    next_count = current_count;

    case (current_state)
      no_car: begin
        if (a) begin
          car_enter  = 1'b1;
          next_state = car_a;
        end else begin
          next_state = no_car;
        end
      end
      car_a: begin
        if (b) begin
          next_state = car_b;
        end else if (a) begin
          next_state = car_a;
        end else begin
          next_state = no_car;
        end
      end
      car_b: begin
        if (!a && !b) begin
          car_exit   = 1'b1;
          next_state = no_car;
        end else if (b) begin
          next_state = car_b;
        end else if (a) begin
          next_state = car_a;
        end
      end
      default: next_state = no_car;
    endcase
  end
endmodule
