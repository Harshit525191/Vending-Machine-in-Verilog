`include "vending.v"


module vending_tb;

    reg clk;
    reg reset;
    reg [1:0] coinn;
    wire out;
    wire [1:0] changee;

    // Instantiate the vending machine module
    vending uut(
        .clk(clk),
        .reset(reset),
        .coinn(coinn),
        .out(out),
        .changee(changee)
    );

    // Clock generation
    always #10 clk = ~clk;
    initial begin
        clk = 0;
        #200 $finish; // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        $dumpfile("vending_tb.vcd");
        $dumpvars(0, vending_tb);
        $monitor($time, " reset=%b coinn=%b out=%b changee=%b", reset, coinn, out, changee);
        // Initialize inputs
        reset = 1;
        coinn = 2'b00;
        #10 reset = 0;
        #20 coinn = 2'b01; 
        #20 coinn = 2'b00; 
        #20 coinn = 2'b01; 
        #20 coinn = 2'b10; 
        #20 coinn = 2'b10; 
        
        $finish;
    end
endmodule    