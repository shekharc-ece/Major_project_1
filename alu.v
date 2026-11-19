
module alu(
    input [7:0] A,
    input [7:0] B,
    input [2:0] Sel,
    output reg [7:0] Result,
    output reg CarryOut,
    output Zero
);

    always @(*) begin
        case (Sel)

            3'b000: begin
                {CarryOut, Result} = A + B;
            end

            3'b001: begin
                {CarryOut, Result} = A - B;
            end

            3'b010: begin
                {CarryOut, Result} = {1'b0, A & B};
            end

            3'b011: begin
                {CarryOut, Result} = {1'b0, A | B};
            end

            3'b100: begin
                {CarryOut, Result} = {1'b0, A ^ B};
            end

            default: begin
                {CarryOut, Result} = 9'b0;
            end

        endcase
    end

    assign Zero = (Result == 8'b0) ? 1'b1 : 1'b0;

endmodule

