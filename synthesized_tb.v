
`timescale 1ns/1ps

module synthesized_tb;

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

        $dumpfile("synthesized_alu.vcd");
        $dumpvars(0, synthesized_tb);

        $monitor("Time=%0t | Sel=%b | A=%d | B=%d | Result=%d | CarryOut=%b | Zero=%b",
                  $time, Sel, A, B, Result, CarryOut, Zero);

        A = 20; B = 10; Sel = 3'b000;
        #10;

        A = 255; B = 1; Sel = 3'b000;
        #10;

        A = 30; B = 10; Sel = 3'b001;
        #10;

        A = 10; B = 20; Sel = 3'b001;
        #10;

        A = 204; B = 170; Sel = 3'b010;
        #10;

        A = 15; B = 240; Sel = 3'b010;
        #10;

        A = 204; B = 170; Sel = 3'b011;
        #10;

        A = 255; B = 0; Sel = 3'b011;
        #10;

        A = 204; B = 170; Sel = 3'b100;
        #10;

        A = 255; B = 255; Sel = 3'b100;
        #10;

        $finish;

    end

endmodule

