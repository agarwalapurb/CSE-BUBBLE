// Garvit Arora - 200372
// Apurb Agarwal - 200179
// This module contains both the instruction memory as well as the data memory
module veda(
    input [31:0] instructionaddress,
    output reg [31:0] instruction,
    input wire clk,
    input wire memwrite,
    input wire memread,
    input wire [31:0] writedata,
    input wire [31:0] dataaddress,
    output reg [31:0] data
);

reg [7:0] instructionmemory [0:2**10-1];
reg [7:0] datamemory [0:2**10-1];

initial begin
	instructionmemory[0] <= 8'b00100001;
	instructionmemory[1] <= 8'b00000100;
	instructionmemory[2] <= 8'b00000000;
	instructionmemory[3] <= 8'b00000000;
	instructionmemory[4] <= 8'b00001100;
	instructionmemory[5] <= 8'b00000000;
	instructionmemory[6] <= 8'b00000000;
	instructionmemory[7] <= 8'b00001110;
	instructionmemory[8] <= 8'b11111111;
	instructionmemory[9] <= 8'b11111111;
	instructionmemory[10] <= 8'b11111111;
	instructionmemory[11] <= 8'b11111111;
	instructionmemory[12] <= 8'b00000000;
	instructionmemory[13] <= 8'b00000000;
	instructionmemory[14] <= 8'b00000000;
	instructionmemory[15] <= 8'b00000000;
	instructionmemory[16] <= 8'b00010011;
	instructionmemory[17] <= 8'b10101001;
	instructionmemory[18] <= 8'b11111111;
	instructionmemory[19] <= 8'b11111100;
	instructionmemory[20] <= 8'b00000000;
	instructionmemory[21] <= 8'b00001001;
	instructionmemory[22] <= 8'b11101000;
	instructionmemory[23] <= 8'b00000000;
	instructionmemory[24] <= 8'b00100111;
	instructionmemory[25] <= 8'b10111111;
	instructionmemory[26] <= 8'b00000000;
	instructionmemory[27] <= 8'b00000000;
	instructionmemory[28] <= 8'b00000000;
	instructionmemory[29] <= 8'b00001011;
	instructionmemory[30] <= 8'b01001000;
	instructionmemory[31] <= 8'b00000000;
	instructionmemory[32] <= 8'b00000000;
	instructionmemory[33] <= 8'b00001101;
	instructionmemory[34] <= 8'b01011000;
	instructionmemory[35] <= 8'b00000000;
	instructionmemory[36] <= 8'b00000000;
	instructionmemory[37] <= 8'b00001001;
	instructionmemory[38] <= 8'b01101000;
	instructionmemory[39] <= 8'b00000000;
	instructionmemory[40] <= 8'b00100011;
	instructionmemory[41] <= 8'b10111111;
	instructionmemory[42] <= 8'b00000000;
	instructionmemory[43] <= 8'b00000000;
	instructionmemory[44] <= 8'b00010011;
	instructionmemory[45] <= 8'b10101001;
	instructionmemory[46] <= 8'b00000000;
	instructionmemory[47] <= 8'b00000100;
	instructionmemory[48] <= 8'b00000000;
	instructionmemory[49] <= 8'b00001001;
	instructionmemory[50] <= 8'b11101000;
	instructionmemory[51] <= 8'b00000000;
	instructionmemory[52] <= 8'b00001000;
	instructionmemory[53] <= 8'b00000000;
	instructionmemory[54] <= 8'b00000000;
	instructionmemory[55] <= 8'b00000000;
	instructionmemory[56] <= 8'b00010011;
	instructionmemory[57] <= 8'b10101001;
	instructionmemory[58] <= 8'b11111111;
	instructionmemory[59] <= 8'b11111100;
	instructionmemory[60] <= 8'b00000000;
	instructionmemory[61] <= 8'b00001001;
	instructionmemory[62] <= 8'b11101000;
	instructionmemory[63] <= 8'b00000000;
	instructionmemory[64] <= 8'b00100111;
	instructionmemory[65] <= 8'b10111111;
	instructionmemory[66] <= 8'b00000000;
	instructionmemory[67] <= 8'b00000000;
	instructionmemory[68] <= 8'b00010000;
	instructionmemory[69] <= 8'b10010010;
	instructionmemory[70] <= 8'b11111111;
	instructionmemory[71] <= 8'b11111111;
	instructionmemory[72] <= 8'b00000000;
	instructionmemory[73] <= 8'b00000000;
	instructionmemory[74] <= 8'b10000000;
	instructionmemory[75] <= 8'b00000000;
	instructionmemory[76] <= 8'b00000010;
	instructionmemory[77] <= 8'b00010010;
	instructionmemory[78] <= 8'b01001000;
	instructionmemory[79] <= 8'b00001000;
	instructionmemory[80] <= 8'b00101000;
	instructionmemory[81] <= 8'b00001001;
	instructionmemory[82] <= 8'b00000000;
	instructionmemory[83] <= 8'b00010011;
	instructionmemory[84] <= 8'b00000000;
	instructionmemory[85] <= 8'b00000000;
	instructionmemory[86] <= 8'b10001000;
	instructionmemory[87] <= 8'b00000000;
	instructionmemory[88] <= 8'b00000010;
	instructionmemory[89] <= 8'b01010000;
	instructionmemory[90] <= 8'b01010000;
	instructionmemory[91] <= 8'b00000001;
	instructionmemory[92] <= 8'b00000010;
	instructionmemory[93] <= 8'b00101010;
	instructionmemory[94] <= 8'b01011000;
	instructionmemory[95] <= 8'b00001000;
	instructionmemory[96] <= 8'b00101000;
	instructionmemory[97] <= 8'b00001011;
	instructionmemory[98] <= 8'b00000000;
	instructionmemory[99] <= 8'b00001100;
	instructionmemory[100] <= 8'b00000010;
	instructionmemory[101] <= 8'b00100000;
	instructionmemory[102] <= 8'b01011000;
	instructionmemory[103] <= 8'b10000110;
	instructionmemory[104] <= 8'b00000001;
	instructionmemory[105] <= 8'b01100101;
	instructionmemory[106] <= 8'b01100000;
	instructionmemory[107] <= 8'b00000000;
	instructionmemory[108] <= 8'b00100001;
	instructionmemory[109] <= 8'b10001101;
	instructionmemory[110] <= 8'b00000000;
	instructionmemory[111] <= 8'b00000000;
	instructionmemory[112] <= 8'b00100001;
	instructionmemory[113] <= 8'b10001011;
	instructionmemory[114] <= 8'b00000000;
	instructionmemory[115] <= 8'b00000100;
	instructionmemory[116] <= 8'b00000001;
	instructionmemory[117] <= 8'b01101101;
	instructionmemory[118] <= 8'b01000000;
	instructionmemory[119] <= 8'b00001000;
	instructionmemory[120] <= 8'b00101000;
	instructionmemory[121] <= 8'b00001000;
	instructionmemory[122] <= 8'b00000000;
	instructionmemory[123] <= 8'b00000011;
	instructionmemory[124] <= 8'b00001100;
	instructionmemory[125] <= 8'b00000000;
	instructionmemory[126] <= 8'b00000000;
	instructionmemory[127] <= 8'b00000100;
	instructionmemory[128] <= 8'b00100101;
	instructionmemory[129] <= 8'b10001011;
	instructionmemory[130] <= 8'b00000000;
	instructionmemory[131] <= 8'b00000100;
	instructionmemory[132] <= 8'b00100101;
	instructionmemory[133] <= 8'b10001101;
	instructionmemory[134] <= 8'b00000000;
	instructionmemory[135] <= 8'b00000000;
	instructionmemory[136] <= 8'b00010010;
	instructionmemory[137] <= 8'b00101000;
	instructionmemory[138] <= 8'b00000000;
	instructionmemory[139] <= 8'b00000001;
	instructionmemory[140] <= 8'b00000000;
	instructionmemory[141] <= 8'b00001000;
	instructionmemory[142] <= 8'b10001000;
	instructionmemory[143] <= 8'b00000000;
	instructionmemory[144] <= 8'b00000100;
	instructionmemory[145] <= 8'b00000000;
	instructionmemory[146] <= 8'b00000000;
	instructionmemory[147] <= 8'b00010111;
	instructionmemory[148] <= 8'b00010010;
	instructionmemory[149] <= 8'b00001000;
	instructionmemory[150] <= 8'b00000000;
	instructionmemory[151] <= 8'b00000001;
	instructionmemory[152] <= 8'b00000000;
	instructionmemory[153] <= 8'b00001000;
	instructionmemory[154] <= 8'b10000000;
	instructionmemory[155] <= 8'b00000000;
	instructionmemory[156] <= 8'b00000100;
	instructionmemory[157] <= 8'b00000000;
	instructionmemory[158] <= 8'b00000000;
	instructionmemory[159] <= 8'b00010011;
	instructionmemory[160] <= 8'b00100011;
	instructionmemory[161] <= 8'b10111111;
	instructionmemory[162] <= 8'b00000000;
	instructionmemory[163] <= 8'b00000000;
	instructionmemory[164] <= 8'b00010011;
	instructionmemory[165] <= 8'b10101001;
	instructionmemory[166] <= 8'b00000000;
	instructionmemory[167] <= 8'b00000100;
	instructionmemory[168] <= 8'b00000000;
	instructionmemory[169] <= 8'b00001001;
	instructionmemory[170] <= 8'b11101000;
	instructionmemory[171] <= 8'b00000000;
	instructionmemory[172] <= 8'b00001000;
	instructionmemory[173] <= 8'b00000000;
	instructionmemory[174] <= 8'b00000000;
	instructionmemory[175] <= 8'b00000000;
end

always @* begin
    instruction[31:24] <= instructionmemory[instructionaddress];
    instruction[23:16] <= instructionmemory[instructionaddress+1];
    instruction[15:8] <= instructionmemory[instructionaddress+2];
    instruction[7:0] <= instructionmemory[instructionaddress+3];
end


initial begin
	datamemory[0] <= 8'b00000000;
	datamemory[1] <= 8'b00000000;
	datamemory[2] <= 8'b00000000;
	datamemory[3] <= 8'b00010101;
	datamemory[4] <= 8'b00000000;
	datamemory[5] <= 8'b00000000;
	datamemory[6] <= 8'b00000000;
	datamemory[7] <= 8'b00000010;
	datamemory[8] <= 8'b00000000;
	datamemory[9] <= 8'b00000000;
	datamemory[10] <= 8'b00000000;
	datamemory[11] <= 8'b10000101;
	datamemory[12] <= 8'b00000000;
	datamemory[13] <= 8'b00000000;
	datamemory[14] <= 8'b00000000;
	datamemory[15] <= 8'b00000100;
	datamemory[16] <= 8'b00000000;
	datamemory[17] <= 8'b00000000;
	datamemory[18] <= 8'b00000000;
	datamemory[19] <= 8'b00000010;
	datamemory[20] <= 8'b00000000;
	datamemory[21] <= 8'b00000000;
	datamemory[22] <= 8'b00000000;
	datamemory[23] <= 8'b00001010;
	datamemory[24] <= 8'b00000000;
	datamemory[25] <= 8'b00000000;
	datamemory[26] <= 8'b00000000;
	datamemory[27] <= 8'b00000110;
	datamemory[28] <= 8'b00000000;
	datamemory[29] <= 8'b00000000;
	datamemory[30] <= 8'b00000000;
	datamemory[31] <= 8'b00001001;
	datamemory[32] <= 8'b00000000;
	datamemory[33] <= 8'b00000000;
	datamemory[34] <= 8'b00000000;
	datamemory[35] <= 8'b00000000;
	datamemory[36] <= 8'b00000000;
	datamemory[37] <= 8'b00000000;
	datamemory[38] <= 8'b00000000;
	datamemory[39] <= 8'b00001000;
	datamemory[40] <= 8'b00000000;
	datamemory[41] <= 8'b00000000;
	datamemory[42] <= 8'b00000000;
	datamemory[43] <= 8'b00011001;
	datamemory[44] <= 8'b00000000;
	datamemory[45] <= 8'b00000000;
	datamemory[46] <= 8'b00000000;
	datamemory[47] <= 8'b01000101;
	datamemory[48] <= 8'b00000000;
	datamemory[49] <= 8'b00000000;
	datamemory[50] <= 8'b00000000;
	datamemory[51] <= 8'b00001110;
	datamemory[52] <= 8'b00000000;
	datamemory[53] <= 8'b00000000;
	datamemory[54] <= 8'b00000000;
	datamemory[55] <= 8'b01010001;
	datamemory[56] <= 8'b00000000;
	datamemory[57] <= 8'b00000000;
	datamemory[58] <= 8'b00000000;
	datamemory[59] <= 8'b01010000;
	datamemory[60] <= 8'b00000000;
	datamemory[61] <= 8'b00000000;
	datamemory[62] <= 8'b00000000;
	datamemory[63] <= 8'b00111000;
	datamemory[64] <= 8'b00000000;
	datamemory[65] <= 8'b00000000;
	datamemory[66] <= 8'b00000000;
	datamemory[67] <= 8'b00111110;
	datamemory[68] <= 8'b00000000;
	datamemory[69] <= 8'b00000000;
	datamemory[70] <= 8'b00000000;
	datamemory[71] <= 8'b00101100;
	datamemory[72] <= 8'b00000000;
	datamemory[73] <= 8'b00000000;
	datamemory[74] <= 8'b00000000;
	datamemory[75] <= 8'b00010111;
	datamemory[76] <= 8'b00000000;
	datamemory[77] <= 8'b00000000;
	datamemory[78] <= 8'b00000000;
	datamemory[79] <= 8'b00001010;
	datamemory[80] <= 8'b00000000;
	datamemory[81] <= 8'b00000000;
	datamemory[82] <= 8'b00000000;
	datamemory[83] <= 8'b00010010;
	datamemory[84] <= 8'b00000000;
	datamemory[85] <= 8'b00000000;
	datamemory[86] <= 8'b00000000;
	datamemory[87] <= 8'b01011001;
end

always @(*) begin
    if(memread==1) begin
        data[31:24] <= datamemory[dataaddress];
        data[23:16] <= datamemory[dataaddress+1];
        data[15:8] <= datamemory[dataaddress+2];
        data[7:0] <= datamemory[dataaddress+3];
    end
        
end

always @(negedge clk) begin
    if(memwrite==1) begin
        datamemory[dataaddress] = writedata[31:24];
        datamemory[dataaddress+1] = writedata[23:16];
        datamemory[dataaddress+2] = writedata[15:8];
        datamemory[dataaddress+3] = writedata[7:0];
    end
end
integer i;  
reg [31:0] num;
reg [31:0] element;
always @(*) begin
	num[31:24] <= datamemory[0];
    num[23:16] <= datamemory[1];
    num[15:8] <= datamemory[2];
    num[7:0] <= datamemory[3];
end
// printing the sorted numbers
always @(posedge clk) begin
    if(instruction==32'b111111_11111_11111_11111_11111111111)begin
		$display("Sorted numbers : ");
        for(i=0; i<num; i=i+1)begin
            element[31:24] = datamemory[4*i+4];
            element[23:16] = datamemory[4*i+5];
            element[15:8] = datamemory[4*i+6];
            element[7:0] = datamemory[4*i+7];
            $display(element);
        end
    end
end


endmodule