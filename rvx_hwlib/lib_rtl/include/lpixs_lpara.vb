// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2025-08-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************
localparam BW_LPI_BURDEN_NZ = `LEAST1(BW_LPI_BURDEN);
localparam HAS_LPI_BURDEN = (BW_LPI_BURDEN>0);

localparam BW_LPI_QPARCEL = BW_LPIXS_QPARCEL(BW_LPIXS_ADDR,BW_LPIXS_DATA);
localparam BW_LPI_YPARCEL = BW_LPIXS_YPARCEL(BW_LPIXS_DATA);

localparam BW_LPI_QDATA = BW_LPI_DATA(BW_LPI_BURDEN,BW_LPI_QPARCEL);
localparam BW_LPI_YDATA = BW_LPI_DATA(BW_LPI_BURDEN,BW_LPI_YPARCEL);
