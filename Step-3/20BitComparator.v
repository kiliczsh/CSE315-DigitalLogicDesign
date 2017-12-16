module EightBitComparator(input [19:0]a,input [19:0]b,output eq,output gt,output lt);
    assign eq = a == b;
    assign gt = a > b;
    assign lt = a < b;
endmodule