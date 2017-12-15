// Component : 1BitDecoder

module 1BitDecoder( Bit,
                               Enable,
                               L_0_e78dbff2,
                               L_1_6ca00f3f);
   input  Bit;
   input  Enable;

   output L_0_e78dbff2;
   output L_1_6ca00f3f;

   wire s_LOGISIM_NET_0;
   wire s_LOGISIM_NET_1;
   wire s_LOGISIM_NET_2;
   wire s_LOGISIM_NET_3;
   wire s_LOGISIM_NET_4;

   assign s_LOGISIM_NET_2                    = Enable;
   assign s_LOGISIM_NET_3                    = Bit;

   assign L_1_6ca00f3f                       = s_LOGISIM_NET_1;
   assign L_0_e78dbff2                       = s_LOGISIM_NET_0;

   AND_GATE #(.BubblesMask(0))
      GATE_1 (.Input_1(s_LOGISIM_NET_3),
              .Input_2(s_LOGISIM_NET_2),
              .Result(s_LOGISIM_NET_1));

   NOT_GATE      GATE_2 (.Input_1(s_LOGISIM_NET_3),
                         .Result(s_LOGISIM_NET_4));

   AND_GATE #(.BubblesMask(0))
      GATE_3 (.Input_1(s_LOGISIM_NET_4),
              .Input_2(s_LOGISIM_NET_2),
              .Result(s_LOGISIM_NET_0));



endmodule
