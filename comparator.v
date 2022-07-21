input [3:0] a;
input [3:0] b;

output equal;

wire bit_3_equal;
wire bit_2_equal;
wire bit_1_equal;
wire bit_0_equal;

wire bit_10_equal;
wire bit_32_equal;

assign bit_3_equal = a[3] ~^ b[3];
assign bit_2_equal = a[2] ~^ b[2];
assign bit_1_equal = a[1] ~^ b[1];
assign bit_0_equal = a[0] ~^ b[0];

assign bit_10_equal = bit_1_equal & bit_0_equal;
assign bit_32_equal = bit_3_equal & bit_2_equal;

assign equal = bit_32_equal & bit_10_equal;
