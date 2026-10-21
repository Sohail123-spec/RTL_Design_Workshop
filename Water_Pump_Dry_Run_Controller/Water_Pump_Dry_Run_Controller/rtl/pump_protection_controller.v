
`timescale 1ns/1ps

module pump_protection_controller #(
    parameter integer LOCKOUT_CYCLES = 10
) (
    input  wire clk,
    input  wire reset,
    input  wire pump_demand,
    input  wire dry_run_fault,

    output reg  pump_enable,
    output reg  fault_status
);

    localparam [1:0] IDLE    = 2'b00;
    localparam [1:0] RUNNING = 2'b01;
    localparam [1:0] LOCKOUT = 2'b10;

    function integer clog2;
        input integer value;
        integer temp;
        begin
            temp = value - 1;
            for (clog2 = 0; temp > 0; clog2 = clog2 + 1)
                temp = temp >> 1;
        end
    endfunction

    localparam integer COUNTER_WIDTH =
        (LOCKOUT_CYCLES <= 1) ? 1 : clog2(LOCKOUT_CYCLES);

    reg [1:0] state;
    reg [COUNTER_WIDTH-1:0] lockout_count;

    initial begin
        if (LOCKOUT_CYCLES < 1)
            $fatal(1, "LOCKOUT_CYCLES must be >= 1");
    end

    always @(posedge clk) begin
        if (reset) begin
            state         <= IDLE;
            lockout_count <= 0;
            pump_enable   <= 1'b0;
            fault_status  <= 1'b0;
        end else begin
            case (state)

                IDLE: begin
                    pump_enable   <= 1'b0;
                    lockout_count <= 0;

                    if (dry_run_fault) begin
                        state        <= LOCKOUT;
                        fault_status <= 1'b1;
                    end else if (pump_demand) begin
                        state       <= RUNNING;
                        pump_enable <= 1'b1;
                    end
                end

                RUNNING: begin
                    if (dry_run_fault) begin
                        state         <= LOCKOUT;
                        lockout_count <= 0;
                        pump_enable   <= 1'b0;
                        fault_status  <= 1'b1;
                    end else if (!pump_demand) begin
                        state       <= IDLE;
                        pump_enable <= 1'b0;
                    end else begin
                        pump_enable <= 1'b1;
                    end
                end

                LOCKOUT: begin
                    pump_enable <= 1'b0;

                    if (lockout_count == LOCKOUT_CYCLES - 1) begin
                        lockout_count <= 0;

                        if (!dry_run_fault && pump_demand) begin
                            state        <= RUNNING;
                            pump_enable  <= 1'b1;
                            fault_status <= 1'b0;
                        end else begin
                            state        <= LOCKOUT;
                            fault_status <= 1'b1;
                        end
                    end else begin
                        lockout_count <= lockout_count + 1'b1;
                    end
                end

                default: begin
                    state         <= IDLE;
                    lockout_count <= 0;
                    pump_enable   <= 1'b0;
                    // Preserve fault_status: only reset or successful
                    // recovery is allowed to clear it.
                end

            endcase
        end
    end

endmodule

