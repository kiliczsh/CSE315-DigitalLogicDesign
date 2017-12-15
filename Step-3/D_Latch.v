
//Component : D_Latch

module D_Latch( AscSet0,
                D,
                WE,
                Output);

   input  AscSet0;
   input  D;
   input  WE;

   output Output;
   wire s_LOGISIM_NET_0;
   wire s_LOGISIM_NET_1;
   wire s_LOGISIM_NET_2;
   wire s_LOGISIM_NET_3;
   wire s_LOGISIM_NET_4;
   wire s_LOGISIM_NET_5;
   wire s_LOGISIM_NET_6;

   assign s_LOGISIM_NET_1                    = WE;
   assign s_LOGISIM_NET_0                    = D;
   assign s_LOGISIM_NET_3                    = AscSet0;
   
   assign Output                             = s_LOGISIM_NET_4;

   NOR_GATE_3_INPUTS #(.BubblesMask(0))
      GATE_1 (.Input_1(s_LOGISIM_NET_2),
              .Input_2(s_LOGISIM_NET_3),
              .Input_3(s_LOGISIM_NET_5),
              .Result(s_LOGISIM_NET_4));

   AND_GATE #(.BubblesMask(2))
      GATE_2 (.Input_1(s_LOGISIM_NET_1),
              .Input_2(s_LOGISIM_NET_0),
              .Result(s_LOGISIM_NET_5));

   NOR_GATE #(.BubblesMask(0))
      GATE_3 (.Input_1(s_LOGISIM_NET_6),
              .Input_2(s_LOGISIM_NET_4),
              .Result(s_LOGISIM_NET_2));

   AND_GATE #(.BubblesMask(0))
      GATE_4 (.Input_1(s_LOGISIM_NET_0),
              .Input_2(s_LOGISIM_NET_1),
              .Result(s_LOGISIM_NET_6));


endmodule
