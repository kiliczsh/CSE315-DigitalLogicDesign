module Half_Adder( output c, s, input a, b );
  xor xor01 (s, a, b);
  and and01 (c, a, b);
endmodule // Half_Adder
 
module Full_Adder( output c_out, s, input a, b, c_in );
 
  wire s_ha1, c_ha1, c_ha2;
  Half_Adder ha01( c_ha1, s_ha1, a, b );
  Half_Adder ha02( c_ha2, s, s_ha1, c_in );
  or or01 ( c_out, c_ha1, c_ha2 );
 
endmodule // Full_Adder
 
module BitAdder20( output [19:0] s, input [19:0] a, b );
 
  wire [20:0] c;
 
  Half_Adder adder00 ( c[1], s[0], a[0], b[0] );
  Full_Adder adder01 ( c[2], s[1], a[1], b[1], c[1] );
  Full_Adder adder02 ( c[3], s[2], a[2], b[2], c[2] );
  Full_Adder adder03 ( c[4], s[3], a[3], b[3], c[3] );
  Full_Adder adder04 ( c[5], s[4], a[4], b[4], c[4] ); 
  Full_Adder adder05 ( c[6], s[5], a[5], b[5], c[5] );
  Full_Adder adder06 ( c[7], s[6], a[6], b[6], c[6] );
  Full_Adder adder07 ( c[8], s[7], a[7], b[7], c[7] );
  Full_Adder adder08 ( c[9], s[8], a[8], b[8], c[8] );
  Full_Adder adder09 ( c[10], s[9], a[9], b[9], c[9] );
  Full_Adder adder10 ( c[11], s[10], a[10], b[10], c[10] );
  Full_Adder adder11 ( c[12], s[11], a[11], b[11], c[11] );
  Full_Adder adder12 ( c[13], s[12], a[12], b[12], c[12] );
  Full_Adder adder13 ( c[14], s[13], a[13], b[13], c[13] );
  Full_Adder adder14 ( c[15], s[14], a[14], b[14], c[14] );
  Full_Adder adder15 ( c[16], s[15], a[15], b[15], c[15] );
  Full_Adder adder16 ( c[17], s[16], a[16], b[16], c[16] );
  Full_Adder adder17 ( c[18], s[17], a[17], b[17], c[17] );
  Full_Adder adder18 ( c[19], s[18], a[18], b[18], c[18] );
  Full_Adder adder19 ( c[20], s[19], a[19], b[19], c[19] );

  assign s[19] = c[19];
 
endmodule // Full_Adder20

