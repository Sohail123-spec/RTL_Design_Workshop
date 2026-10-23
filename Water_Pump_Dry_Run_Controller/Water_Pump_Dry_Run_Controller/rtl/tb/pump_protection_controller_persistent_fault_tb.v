
`timescale 1ns/1ps

module pump_protection_controller_persistent_fault_tb;

    reg clk = 0;
    reg reset = 1;
    reg pump_demand = 0;
    reg dry_run_fault = 0;

    wire pump_enable;
    wire fault_status;
    integer errors = 0;

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

    task tick;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    task check;
        input expected_pump;
        input expected_fault;
        input [8*65-1:0] label_text;
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
        check(1, 0, "Pump starts");

        @(negedge clk);
        dry_run_fault = 1;

        tick;
        check(0, 1, "Fault enters lockout");

        tick;
        check(0, 1, "First lockout interval cycle one");

        tick;
        check(0, 1, "First lockout interval cycle two");

        tick;
        check(0, 1, "Persistent fault blocks first recheck");

        @(negedge clk);
        dry_run_fault = 0;

        tick;
        check(0, 1, "Second lockout interval cycle one");

        tick;
        check(0, 1, "Second lockout interval cycle two");

        tick;
        check(1, 0, "Restart only at second interval expiry");

        if (errors == 0) begin
            $display("ALL PERSISTENT-FAULT TESTS PASSED");
            $finish;
        end else begin
            $display("PERSISTENT-FAULT TESTS FAILED: %0d error(s)", errors);
            $fatal(1, "Persistent-fault testbench failed with %0d error(s)", errors);
        end
    end

endmodule
