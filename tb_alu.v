
`timescale 1ns/1ps

module tb_alu;

    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] Sel;

    wire [7:0] Result;
    wire CarryOut;
    wire Zero;

    alu uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Result(Result),
        .CarryOut(CarryOut),
        .Zero(Zero)
    );

    initial begin

        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);

        $monitor("Time=%0t | Sel=%b | A=%d | B=%d | Result=%d | CarryOut=%b | Zero=%b",
                  $time, Sel, A, B, Result, CarryOut, Zero);

        // 1. Normal Addition
        A = 20; B = 10; Sel = 3'b000;
        #10;

        // 2. Addition Overflow
        A = 255; B = 1; Sel = 3'b000;
        #10;

        // 3. Normal Subtraction
        A = 30; B = 10; Sel = 3'b001;
        #10;

        // 4. Subtraction with Borrow
        A = 10; B = 20; Sel = 3'b001;
        #10;

        // 5. AND Operation
        A = 8'b11001100; B = 8'b10101010;
        Sel = 3'b010;
        #10;

        // 6. AND Result Zero
        A = 8'b00001111; B = 8'b11110000;
        Sel = 3'b010;
        #10;

        // 7. OR Operation
        A = 8'b11001100; B = 8'b10101010;
        Sel = 3'b011;
        #10;

        // 8. OR Result All Ones
        A = 8'b11111111; B = 8'b00000000;
        Sel = 3'b011;
        #10;

        // 9. XOR Operation
        A = 8'b11001100; B = 8'b10101010;
        Sel = 3'b100;
        #10;

        // 10. XOR Result Zero
        A = 8'b11111111; B = 8'b11111111;
        Sel = 3'b100;
        #10;

        $finish;

    end

endmodule


