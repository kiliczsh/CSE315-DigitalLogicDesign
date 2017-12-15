module 20BitAdder (A, B, sum);
input [19:0] A, B;
output [19:0] sum;
reg [19:0] sum;
always @(A or B) begin
sum = A + B;
end
endmodule