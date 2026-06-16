module multiplier_param #(
    parameter int N = 16
)(
    input  logic [N-1:0]   in1,
    input  logic [N-1:0]   in2,
    input  logic           start,
    input  logic           reset,
    input  logic           clk,

    output logic [2*N-1:0] out,
    output logic           done
);

// Bits necessários para o contador: N+1 ciclos (1 extra pro load)
localparam int CNT_BITS = $clog2(N+2) + 1;
localparam logic [CNT_BITS-1:0] CNT_INIT = CNT_BITS'(N + 1);

typedef enum logic [1:0] {IDLE, RUN, DONE} state_t;
state_t state, next_state;

logic              load, clear;
logic [2*N-1:0]    partial, par_out_a;
logic [N-1:0]      par_out_b;
logic [CNT_BITS-1:0] count;

// SHIFT REGISTER A — 2*N bits
always_ff @(posedge clk, posedge reset) begin
    if (reset)
        par_out_a <= '0;
    else if (load)
        par_out_a <= {{N{1'b0}}, in1};
    else
        par_out_a <= {par_out_a[2*N-2:0], 1'b0};
end

// SHIFT REGISTER B — N bits
always_ff @(posedge clk, posedge reset) begin
    if (reset)
        par_out_b <= '0;
    else if (load)
        par_out_b <= in2;
    else
        par_out_b <= {1'b0, par_out_b[N-1:1]};
end

// MULTIPLEXER (combinacional)
always_comb begin
    partial = par_out_b[0] ? par_out_a : '0;
end

// ACCUMULATOR
always_ff @(posedge clk, posedge reset) begin
    if (reset)
        out <= '0;
    else if (clear)
        out <= '0;
    else
        out <= out + partial;
end

// COUNTER
always_ff @(posedge clk, posedge reset) begin
    if (reset)
        count <= CNT_INIT;
    else if (state != RUN)
        count <= CNT_INIT;
    else
        count <= count - 1'b1;
end

// STATE REGISTER
always_ff @(posedge clk, posedge reset) begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end

// FSM COMBINACIONAL
always_comb begin
    // defaults
    next_state = state;
    load       = 1'b0;
    clear      = 1'b0;
    done       = 1'b0;

    case (state)
        IDLE: begin
            clear      = 1'b1;
            if (start)
                next_state = RUN;
        end

        RUN: begin
            if (count == CNT_BITS'(N))     // primeiro ciclo: carrega
                load = 1'b1;
            if (count == '0)
                next_state = DONE;
        end

        DONE: begin
            done       = 1'b1;
            next_state = IDLE;
        end

        default: begin
            clear      = 1'b1;
            next_state = IDLE;
        end
    endcase
end

endmodule