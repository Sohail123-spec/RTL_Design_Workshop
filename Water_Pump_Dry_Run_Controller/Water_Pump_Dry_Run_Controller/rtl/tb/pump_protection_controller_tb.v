
`timescale 1ns/1ps

module pump_protection_controller_tb;

    reg clk;
    reg reset;
    reg pump_demand;
    reg dry_run_fault;

    wire pump_enable;
    wire fault_status;

    integer errors;

    pump_protection_controller #(
        .LOCKOUT_CYCLES(3)
    ) dut (
        .clk(clk),
        .reset(reset),
        .pump_demand(pump_demand),
        .dry_run_fault(dry_run_fault),
        .pump_enable(pump_enable),
        .fault_status(fault_status)
    );

    always #5 clk = ~clk;

    task check_outputs;
        input expected_pump;
        input expected_fault;
        input [8*80-1:0] test_name;
        begin
            if (pump_enable !== expected_pump ||
                fault_status !== expected_fault) begin
                $display("FAIL: %0s | pump=%b fault=%b expected=%b,%b",
                         test_name, pump_enable, fault_status,
                         expected_pump, expected_fault);
                errors = errors + 1;
            end else begin
                $display("PASS: %0s", test_name);
            end
        end
    endtask

    task tick;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    initial begin
        clk = 0;
        reset = 1;
        pump_demand = 0;
        dry_run_fault = 0;
        errors = 0;

        tick;
        check_outputs(0, 0, "Reset clears outputs");

        @(negedge clk);
        reset = 0;
        pump_demand = 1;

        tick;
        check_outputs(1, 0, "Demand starts pump");

        @(negedge clk);
        pump_demand = 0;

        tick;
        check_outputs(0, 0, "Demand removal stops pump");

        @(negedge clk);
        pump_demand = 1;

        tick;
        check_outputs(1, 0, "Pump starts again on demand");

        @(negedge clk);
        dry_run_fault = 1;

        tick;
        check_outputs(0, 1, "Fault stops pump and sets status");

        @(negedge clk);
        dry_run_fault = 0;
        pump_demand = 1;

        tick;
        check_outputs(0, 1, "First lockout interval");

        tick;
        check_outputs(0, 1, "Second lockout interval");

        tick;
        check_outputs(1, 0, "Recovery at exact lockout expiry");

        @(negedge clk);
        dry_run_fault = 1;

        tick;
        check_outputs(0, 1, "New fault stops pump");

        @(negedge clk);
        dry_run_fault = 0;
        pump_demand = 0;

        tick;
        check_outputs(0, 1, "Demand-low recheck remains locked out");

        tick;
        check_outputs(0, 1, "Repeated lockout interval");

        tick;
        check_outputs(0, 1, "Demand-low expiry retains fault status");

        @(negedge clk);
        pump_demand = 1;

        tick;
        check_outputs(0, 1, "Next lockout interval begins");

        tick;
        check_outputs(0, 1, "Next lockout continues");

        tick;
        check_outputs(1, 0, "Recovery after successful recheck");

        @(negedge clk);
        dry_run_fault = 1;

        tick;
        check_outputs(0, 1, "Fault has priority over demand");

        @(negedge clk);
        reset = 1;
        dry_run_fault = 0;

        tick;
        check_outputs(0, 0, "Reset clears fault status");

        @(negedge clk);
        reset = 0;
        dry_run_fault = 1;
        pump_demand = 1;

        tick;
        check_outputs(0, 1, "Fault present after reset release");

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTS FAILED: %0d error(s)", errors);

        $finish;
    end

endmodule
