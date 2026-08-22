`timescale 1ns/1ps
module tb_incomp_if;
reg i0, i1, i2;
wire y;

incomp_if uut (
    .i0(i0), .i1(i1), .i2(i2), .y(y)
);

initial begin
    $dumpfile("tb_incomp_if.vcd");
    $dumpvars(0, tb_incomp_if);
    i0 = 1'b0;
    i1 = 1'b0;
    i2 = 1'b0;
    #3000 $finish;
end

always #31 i0 = ~i0;
always #37 i1 = ~i1;
always #57 i2 = ~i2;
endmodule
