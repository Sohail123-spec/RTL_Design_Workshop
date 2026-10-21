
`timescale 1ns/1ps

module pump_protection_controller_lockout1_tb;

    reg clk = 0;
    reg reset = 1;
    reg pump_demand = 0;
    reg dry_run_fault = 0;

    wire pump_enable;
    wire fault_status;
    integer errors = 0;

    pump_protection_controller #(
        .LOCKOUT_CYCLES(1)
    ) dut (
        .clk(clk),
        .reset(reset),
        .pump_demand(pump_demand),
        .dry_run_fault(dry_run_fault),
        .pump_enable(pump_enable),
        .fault_status(fault_status)
    );

    always #5 clk = ~clk;

    task tick;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    task check;
        input expected_pump;
        input expected_fault;
        input [8*60-1:0] label_text;
        begin
            if (pump_enable !== expected_pump ||
                fault_status !== expected_fault) begin
                $display("FAIL: %0s | pump=%b fault=%b",
                         label_text, pump_enable, fault_status);
                errors = errors + 1;
            end else begin
                $display("PASS: %0s", label_text);
            end
        end
    endtask

    initial begin
        tick;
        check(0, 0, "Reset");

        @(negedge clk);
        reset = 0;
        pump_demand = 1;

        tick;
        check(1, 0, "Demand starts pump");

        @(negedge clk);
        dry_run_fault = 1;

        tick;
        check(0, 1, "Fault enters lockout");

        @(negedge clk);
        // Keep fault high through the first recheck.

        tick;
        check(0, 1, "High fault restarts full lockout");

        @(negedge clk);
        dry_run_fault = 0;

        tick;
        check(1, 0, "Recovery at next one-cycle recheck");

        if (errors == 0)
            $display("ALL LOCKOUT-1 TESTS PASSED");
        else
            $display("LOCKOUT-1 TESTS FAILED: %0d error(s)", errors);

        $finish;
    end

endmodule
