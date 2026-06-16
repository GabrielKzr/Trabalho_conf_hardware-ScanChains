
//input ports
add mapped point Bus2IP_Clk Bus2IP_Clk -type PI PI
add mapped point Bus2IP_Reset Bus2IP_Reset -type PI PI
add mapped point Bus2IP_Data[7] Bus2IP_Data[7] -type PI PI
add mapped point Bus2IP_Data[6] Bus2IP_Data[6] -type PI PI
add mapped point Bus2IP_Data[5] Bus2IP_Data[5] -type PI PI
add mapped point Bus2IP_Data[4] Bus2IP_Data[4] -type PI PI
add mapped point Bus2IP_Data[3] Bus2IP_Data[3] -type PI PI
add mapped point Bus2IP_Data[2] Bus2IP_Data[2] -type PI PI
add mapped point Bus2IP_Data[1] Bus2IP_Data[1] -type PI PI
add mapped point Bus2IP_Data[0] Bus2IP_Data[0] -type PI PI
add mapped point Bus2IP_RdCE[0] Bus2IP_RdCE[0] -type PI PI
add mapped point Bus2IP_RdCE[1] Bus2IP_RdCE[1] -type PI PI
add mapped point Bus2IP_RdCE[2] Bus2IP_RdCE[2] -type PI PI
add mapped point Bus2IP_RdCE[3] Bus2IP_RdCE[3] -type PI PI
add mapped point Bus2IP_RdCE[4] Bus2IP_RdCE[4] -type PI PI
add mapped point Bus2IP_RdCE[5] Bus2IP_RdCE[5] -type PI PI
add mapped point Bus2IP_RdCE[6] Bus2IP_RdCE[6] -type PI PI
add mapped point Bus2IP_RdCE[7] Bus2IP_RdCE[7] -type PI PI
add mapped point Bus2IP_RdCE[8] Bus2IP_RdCE[8] -type PI PI
add mapped point Bus2IP_RdCE[9] Bus2IP_RdCE[9] -type PI PI
add mapped point Bus2IP_RdCE[10] Bus2IP_RdCE[10] -type PI PI
add mapped point Bus2IP_RdCE[11] Bus2IP_RdCE[11] -type PI PI
add mapped point Bus2IP_RdCE[12] Bus2IP_RdCE[12] -type PI PI
add mapped point Bus2IP_RdCE[13] Bus2IP_RdCE[13] -type PI PI
add mapped point Bus2IP_RdCE[14] Bus2IP_RdCE[14] -type PI PI
add mapped point Bus2IP_WrCE[0] Bus2IP_WrCE[0] -type PI PI
add mapped point Bus2IP_WrCE[1] Bus2IP_WrCE[1] -type PI PI
add mapped point Bus2IP_WrCE[2] Bus2IP_WrCE[2] -type PI PI
add mapped point Bus2IP_WrCE[3] Bus2IP_WrCE[3] -type PI PI
add mapped point Bus2IP_WrCE[4] Bus2IP_WrCE[4] -type PI PI
add mapped point Bus2IP_WrCE[5] Bus2IP_WrCE[5] -type PI PI
add mapped point Bus2IP_WrCE[6] Bus2IP_WrCE[6] -type PI PI
add mapped point Bus2IP_WrCE[7] Bus2IP_WrCE[7] -type PI PI
add mapped point Bus2IP_WrCE[8] Bus2IP_WrCE[8] -type PI PI
add mapped point Bus2IP_WrCE[9] Bus2IP_WrCE[9] -type PI PI
add mapped point Bus2IP_WrCE[10] Bus2IP_WrCE[10] -type PI PI
add mapped point Bus2IP_WrCE[11] Bus2IP_WrCE[11] -type PI PI
add mapped point Bus2IP_WrCE[12] Bus2IP_WrCE[12] -type PI PI
add mapped point Bus2IP_WrCE[13] Bus2IP_WrCE[13] -type PI PI
add mapped point Bus2IP_WrCE[14] Bus2IP_WrCE[14] -type PI PI

//output ports
add mapped point IP2Bus_Data[7] IP2Bus_Data[7] -type PO PO
add mapped point IP2Bus_Data[6] IP2Bus_Data[6] -type PO PO
add mapped point IP2Bus_Data[5] IP2Bus_Data[5] -type PO PO
add mapped point IP2Bus_Data[4] IP2Bus_Data[4] -type PO PO
add mapped point IP2Bus_Data[3] IP2Bus_Data[3] -type PO PO
add mapped point IP2Bus_Data[2] IP2Bus_Data[2] -type PO PO
add mapped point IP2Bus_Data[1] IP2Bus_Data[1] -type PO PO
add mapped point IP2Bus_Data[0] IP2Bus_Data[0] -type PO PO
add mapped point user_int user_int -type PO PO

//inout ports




//Sequential Pins
add mapped point EA[3]/q EA_reg_3/Q  -type DFF DFF
add mapped point EA[1]/q EA_reg_1/Q  -type DFF DFF
add mapped point EA[2]/q EA_reg_2/Q  -type DFF DFF
add mapped point EA[0]/q EA_reg_0/Q  -type DFF DFF
add mapped point slv_reg[4][2]/q slv_reg_reg_4_2/Q  -type DFF DFF
add mapped point slv_reg[6][5]/q slv_reg_reg_6_5/Q  -type DFF DFF
add mapped point slv_reg[5][1]/q slv_reg_reg_5_1/Q  -type DFF DFF
add mapped point slv_reg[6][7]/q slv_reg_reg_6_7/Q  -type DFF DFF
add mapped point slv_reg[4][3]/q slv_reg_reg_4_3/Q  -type DFF DFF
add mapped point slv_reg[4][1]/q slv_reg_reg_4_1/Q  -type DFF DFF
add mapped point slv_reg[5][5]/q slv_reg_reg_5_5/Q  -type DFF DFF
add mapped point slv_reg[9][0]/q slv_reg_reg_9_0/Q  -type DFF DFF
add mapped point slv_reg[8][1]/q slv_reg_reg_8_1/Q  -type DFF DFF
add mapped point slv_reg[8][7]/q slv_reg_reg_8_7/Q  -type DFF DFF
add mapped point slv_reg[8][6]/q slv_reg_reg_8_6/Q  -type DFF DFF
add mapped point slv_reg[4][0]/q slv_reg_reg_4_0/Q  -type DFF DFF
add mapped point slv_reg[8][4]/q slv_reg_reg_8_4/Q  -type DFF DFF
add mapped point slv_reg[8][2]/q slv_reg_reg_8_2/Q  -type DFF DFF
add mapped point slv_reg[4][6]/q slv_reg_reg_4_6/Q  -type DFF DFF
add mapped point slv_reg[4][7]/q slv_reg_reg_4_7/Q  -type DFF DFF
add mapped point slv_reg[4][5]/q slv_reg_reg_4_5/Q  -type DFF DFF
add mapped point slv_reg[8][0]/q slv_reg_reg_8_0/Q  -type DFF DFF
add mapped point slv_reg[8][5]/q slv_reg_reg_8_5/Q  -type DFF DFF
add mapped point slv_reg[6][1]/q slv_reg_reg_6_1/Q  -type DFF DFF
add mapped point slv_reg[5][0]/q slv_reg_reg_5_0/Q  -type DFF DFF
add mapped point slv_reg[8][3]/q slv_reg_reg_8_3/Q  -type DFF DFF
add mapped point slv_reg[7][0]/q slv_reg_reg_7_0/Q  -type DFF DFF
add mapped point slv_reg[7][5]/q slv_reg_reg_7_5/Q  -type DFF DFF
add mapped point slv_reg[7][6]/q slv_reg_reg_7_6/Q  -type DFF DFF
add mapped point slv_reg[7][7]/q slv_reg_reg_7_7/Q  -type DFF DFF
add mapped point slv_reg[7][4]/q slv_reg_reg_7_4/Q  -type DFF DFF
add mapped point slv_reg[5][2]/q slv_reg_reg_5_2/Q  -type DFF DFF
add mapped point slv_reg[4][4]/q slv_reg_reg_4_4/Q  -type DFF DFF
add mapped point slv_reg[7][1]/q slv_reg_reg_7_1/Q  -type DFF DFF
add mapped point slv_reg[5][6]/q slv_reg_reg_5_6/Q  -type DFF DFF
add mapped point slv_reg[5][7]/q slv_reg_reg_5_7/Q  -type DFF DFF
add mapped point slv_reg[6][0]/q slv_reg_reg_6_0/Q  -type DFF DFF
add mapped point slv_reg[6][2]/q slv_reg_reg_6_2/Q  -type DFF DFF
add mapped point slv_reg[6][3]/q slv_reg_reg_6_3/Q  -type DFF DFF
add mapped point slv_reg[6][4]/q slv_reg_reg_6_4/Q  -type DFF DFF
add mapped point slv_reg[6][6]/q slv_reg_reg_6_6/Q  -type DFF DFF
add mapped point slv_reg[7][2]/q slv_reg_reg_7_2/Q  -type DFF DFF
add mapped point slv_reg[7][3]/q slv_reg_reg_7_3/Q  -type DFF DFF
add mapped point slv_reg[5][4]/q slv_reg_reg_5_4/Q  -type DFF DFF
add mapped point slv_reg[5][3]/q slv_reg_reg_5_3/Q  -type DFF DFF
add mapped point slv_reg[3][1]/q slv_reg_reg_3_1/Q  -type DFF DFF
add mapped point slv_reg[2][1]/q slv_reg_reg_2_1/Q  -type DFF DFF
add mapped point slv_reg[0][5]/q slv_reg_reg_0_5/Q  -type DFF DFF
add mapped point slv_reg[1][3]/q slv_reg_reg_1_3/Q  -type DFF DFF
add mapped point slv_reg[3][5]/q slv_reg_reg_3_5/Q  -type DFF DFF
add mapped point slv_reg[1][0]/q slv_reg_reg_1_0/Q  -type DFF DFF
add mapped point slv_reg[1][1]/q slv_reg_reg_1_1/Q  -type DFF DFF
add mapped point slv_reg[0][1]/q slv_reg_reg_0_1/Q  -type DFF DFF
add mapped point slv_reg[0][7]/q slv_reg_reg_0_7/Q  -type DFF DFF
add mapped point slv_reg[2][2]/q slv_reg_reg_2_2/Q  -type DFF DFF
add mapped point slv_reg[0][0]/q slv_reg_reg_0_0/Q  -type DFF DFF
add mapped point slv_reg[0][2]/q slv_reg_reg_0_2/Q  -type DFF DFF
add mapped point slv_reg[0][3]/q slv_reg_reg_0_3/Q  -type DFF DFF
add mapped point slv_reg[0][6]/q slv_reg_reg_0_6/Q  -type DFF DFF
add mapped point slv_reg[0][4]/q slv_reg_reg_0_4/Q  -type DFF DFF
add mapped point slv_reg[1][5]/q slv_reg_reg_1_5/Q  -type DFF DFF
add mapped point slv_reg[3][7]/q slv_reg_reg_3_7/Q  -type DFF DFF
add mapped point slv_reg[2][3]/q slv_reg_reg_2_3/Q  -type DFF DFF
add mapped point slv_reg[2][6]/q slv_reg_reg_2_6/Q  -type DFF DFF
add mapped point slv_reg[2][7]/q slv_reg_reg_2_7/Q  -type DFF DFF
add mapped point slv_reg[1][2]/q slv_reg_reg_1_2/Q  -type DFF DFF
add mapped point slv_reg[3][2]/q slv_reg_reg_3_2/Q  -type DFF DFF
add mapped point slv_reg[2][0]/q slv_reg_reg_2_0/Q  -type DFF DFF
add mapped point slv_reg[1][7]/q slv_reg_reg_1_7/Q  -type DFF DFF
add mapped point slv_reg[2][5]/q slv_reg_reg_2_5/Q  -type DFF DFF
add mapped point slv_reg[3][6]/q slv_reg_reg_3_6/Q  -type DFF DFF
add mapped point slv_reg[1][4]/q slv_reg_reg_1_4/Q  -type DFF DFF
add mapped point slv_reg[1][6]/q slv_reg_reg_1_6/Q  -type DFF DFF
add mapped point slv_reg[2][4]/q slv_reg_reg_2_4/Q  -type DFF DFF
add mapped point slv_reg[3][3]/q slv_reg_reg_3_3/Q  -type DFF DFF
add mapped point slv_reg[3][4]/q slv_reg_reg_3_4/Q  -type DFF DFF
add mapped point slv_reg[3][0]/q slv_reg_reg_3_0/Q  -type DFF DFF
add mapped point address[7]/q address_reg_7/QN  -type DFF DFF
add mapped point address[3]/q address_reg_3/QN  -type DFF DFF
add mapped point slv_reg[10][4]/q slv_reg_reg_10_4/Q  -type DFF DFF
add mapped point slv_reg[10][3]/q slv_reg_reg_10_3/Q  -type DFF DFF
add mapped point address[0]/q address_reg_0/QN  -type DFF DFF
add mapped point address[1]/q address_reg_1/QN  -type DFF DFF
add mapped point address[2]/q address_reg_2/QN  -type DFF DFF
add mapped point slv_reg[13][1]/q slv_reg_reg_13_1/Q  -type DFF DFF
add mapped point slv_reg[13][2]/q slv_reg_reg_13_2/Q  -type DFF DFF
add mapped point endy[1]/q endy_reg_1/Q  -type DFF DFF
add mapped point endx[3]/q endx_reg_3/Q  -type DFF DFF
add mapped point slv_reg[14][1]/q slv_reg_reg_14_1/Q  -type DFF DFF
add mapped point slv_reg[14][2]/q slv_reg_reg_14_2/Q  -type DFF DFF
add mapped point slv_reg[14][3]/q slv_reg_reg_14_3/Q  -type DFF DFF
add mapped point slv_reg[13][0]/q slv_reg_reg_13_0/Q  -type DFF DFF
add mapped point slv_reg[14][0]/q slv_reg_reg_14_0/Q  -type DFF DFF
add mapped point slv_reg[13][3]/q slv_reg_reg_13_3/Q  -type DFF DFF
add mapped point endy[2]/q endy_reg_2/Q  -type DFF DFF
add mapped point endy[0]/q endy_reg_0/Q  -type DFF DFF
add mapped point endy[3]/q endy_reg_3/Q  -type DFF DFF
add mapped point address[4]/q address_reg_4/QN  -type DFF DFF
add mapped point address[6]/q address_reg_6/Q  -type DFF DFF
add mapped point address[5]/q address_reg_5/QN  -type DFF DFF
add mapped point slv_reg[12][3]/q slv_reg_reg_12_3/Q  -type DFF DFF
add mapped point slv_reg[11][1]/q slv_reg_reg_11_1/Q  -type DFF DFF
add mapped point endx[1]/q endx_reg_1/Q  -type DFF DFF
add mapped point slv_reg[12][0]/q slv_reg_reg_12_0/Q  -type DFF DFF
add mapped point slv_reg[12][1]/q slv_reg_reg_12_1/Q  -type DFF DFF
add mapped point slv_reg[12][2]/q slv_reg_reg_12_2/Q  -type DFF DFF
add mapped point slv_reg[11][3]/q slv_reg_reg_11_3/Q  -type DFF DFF
add mapped point slv_reg[11][2]/q slv_reg_reg_11_2/Q  -type DFF DFF
add mapped point slv_reg[11][0]/q slv_reg_reg_11_0/Q  -type DFF DFF
add mapped point user_int/q user_int_reg/Q  -type DFF DFF
add mapped point slv_reg[10][2]/q slv_reg_reg_10_2/Q  -type DFF DFF
add mapped point endx[2]/q endx_reg_2/Q  -type DFF DFF
add mapped point reseta_bit_slv_reg0/q reseta_bit_slv_reg0_reg/Q  -type DFF DFF
add mapped point endx[0]/q endx_reg_0/Q  -type DFF DFF
add mapped point slv_reg[10][0]/q slv_reg_reg_10_0/Q  -type DFF DFF
add mapped point slv_reg[10][1]/q slv_reg_reg_10_1/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
