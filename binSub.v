input [7:0] minuend;
input [7:0] subtrahend;
output [7:0] difference;

wire inv_subtrahend_7;
wire inv_subtrahend_6;
wire inv_subtrahend_5;
wire inv_subtrahend_4;
wire inv_subtrahend_3;
wire inv_subtrahend_2;
wire inv_subtrahend_1;
wire inv_subtrahend_0;

wire negator_carry_0;
wire negator_carry_1;
wire negator_carry_2;
wire negator_carry_3;
wire negator_carry_4;
wire negator_carry_5;
wire negator_carry_6;
wire negator_carry_7;

wire neg_subtrahend_7;
wire neg_subtrahend_6;
wire neg_subtrahend_5;
wire neg_subtrahend_4;
wire neg_subtrahend_3;
wire neg_subtrahend_2;
wire neg_subtrahend_1;
wire neg_subtrahend_0;

wire ha_sum_1;
wire ha_sum_2;
wire ha_sum_3;
wire ha_sum_4;
wire ha_sum_5;
wire ha_sum_6;
wire ha_sum_7;

wire fa_carry_0;
wire fa_carry_1;
wire fa_carry_2;
wire fa_carry_3;
wire fa_carry_4;
wire fa_carry_5;
wire fa_carry_6;

wire ha1_carry_1;
wire ha1_carry_2;
wire ha1_carry_2;
wire ha1_carry_3;
wire ha1_carry_4;
wire ha1_carry_5;
wire ha1_carry_6;

wire ha2_carry_1;
wire ha2_carry_2;
wire ha2_carry_3;
wire ha2_carry_4;
wire ha2_carry_5;
wire ha2_carry_6;

assign inv_subtrahend_7 = ~ subtrahend[7];
assign inv_subtrahend_6 = ~ subtrahend[6];
assign inv_subtrahend_5 = ~ subtrahend[5];
assign inv_subtrahend_4 = ~ subtrahend[4];
assign inv_subtrahend_3 = ~ subtrahend[3];
assign inv_subtrahend_2 = ~ subtrahend[2];
assign inv_subtrahend_1 = ~ subtrahend[1];
assign inv_subtrahend_0 = ~ subtrahend[0];

assign negator_carry_0 = inv_subtrahend_0;
assign negator_carry_1 = negator_carry_0 & inv_subtrahend_1;
assign negator_carry_2 = negator_carry_1 & inv_subtrahend_2;
assign negator_carry_3 = negator_carry_2 & inv_subtrahend_3;
assign negator_carry_4 = negator_carry_3 & inv_subtrahend_4;
assign negator_carry_5 = negator_carry_4 & inv_subtrahend_5;
assign negator_carry_6 = negator_carry_5 & inv_subtrahend_6;
assign negator_carry_7 = negator_carry_6 & inv_subtrahend_7;

assign neg_subtrahend_0 = ~ inv_subtrahend_0;
assign neg_subtrahend_1 = negator_carry_0 ^ inv_subtrahend_1;
assign neg_subtrahend_2 = negator_carry_1 ^ inv_subtrahend_2;
assign neg_subtrahend_3 = negator_carry_2 ^ inv_subtrahend_3;
assign neg_subtrahend_4 = negator_carry_3 ^ inv_subtrahend_4;
assign neg_subtrahend_5 = negator_carry_4 ^ inv_subtrahend_5;
assign neg_subtrahend_6 = negator_carry_5 ^ inv_subtrahend_6;
assign neg_subtrahend_7 = negator_carry_6 ^ inv_subtrahend_7;

assign difference[0] = minuend[0] ^ neg_subtrahend_0;
assign fa_carry_0 = minuend[0] & neg_subtrahend_0;

assign ha_sum_1 = minuend[1] ^ neg_subtrahend_1;
assign difference[1] = ha_sum_1 ^ fa_carry_0;
assign ha1_carry_1 = minuend[1] & neg_subtrahend_1;
assign ha2_carry_1 = fa_carry_0 & ha_sum_1;
assign fa_carry_1 = ha1_carry_1 | ha2_carry_1;

assign ha_sum_2 = minuend[2] ^ neg_subtrahend_2;
assign difference[2] = ha_sum_2 ^ fa_carry_1;
assign ha1_carry_2 = minuend[2] & neg_subtrahend_2;
assign ha2_carry_2 = fa_carry_1 & ha_sum_2;
assign fa_carry_2 = ha1_carry_2 | ha2_carry_2;

assign ha_sum_3 = minuend[3] ^ neg_subtrahend_3;
assign difference[3] = ha_sum_3 ^ fa_carry_2;
assign ha1_carry_3 = minuend[3] & neg_subtrahend_3;
assign ha2_carry_3 = fa_carry_2 & ha_sum_3;
assign fa_carry_3 = ha1_carry_3 | ha2_carry_3;

assign ha_sum_4 = minuend[4] ^ neg_subtrahend_4;
assign difference[4] = ha_sum_4 ^ fa_carry_3;
assign ha1_carry_4 = minuend[4] & neg_subtrahend_4;
assign ha2_carry_4 = fa_carry_3 & ha_sum_4;
assign fa_carry_4 = ha1_carry_4 | ha2_carry_4;

assign ha_sum_5 = minuend[5] ^ neg_subtrahend_5;
assign difference[5] = ha_sum_5 ^ fa_carry_4;
assign ha1_carry_5 = minuend[5] & neg_subtrahend_5;
assign ha2_carry_5 = fa_carry_4 & ha_sum_5;
assign fa_carry_5 = ha1_carry_5 | ha2_carry_5;

assign ha_sum_6 = minuend[6] ^ neg_subtrahend_6;
assign difference[6] = ha_sum_6 ^ fa_carry_5;
assign ha1_carry_6 = minuend[6] & neg_subtrahend_6;
assign ha2_carry_6 = fa_carry_5 & ha_sum_6;
assign fa_carry_6 = ha1_carry_6 | ha2_carry_6;

assign ha_sum_7 = minuend[7] ^ neg_subtrahend_7;
assign difference[7] = ha_sum_7 ^ fa_carry_6;
