module instructiondecode( 
	input[5:0] opcode,  
    input[5:0] function, // Not sure if needed
    
    output reg[2:0] alu_op,
    output reg[1:0] memToReg, regDst,
    output reg jump,branch,mem_read,mem_write,alu_src,reg_write,sign_or_zero, regDst, memToReg                      
);

	//Instructions: LW, SW, J, JR, JAL, BEQ, BNE, XORI, ADDI, ADD, SUB, SLT
    // Link: http://alumni.cs.ucr.edu/~vladimir/cs161/mips.html
    parameter LW = 6'b100011; // Type: I
    parameter SW = 6'b101011; // Type: I
    parameter J = 6'b000010; // Type: J 
    parameter JAL = 6'b000011; // Type: J -> Jump and Link
    parameter BEQ = 6'b000100; // Type: I
    parameter BNE = 6'b000101; // Type: I
    parameter XORI = 6'b001110; // Type: I
    parameter ADDI = 6'b001000; // Type: I

    // ALU Control mapping
    parameter alu_add = 3'd0;
    parameter alu_sub = 3'd1;
    parameter alu_xor = 3'd2;
    parameter alu_slt = 3'd3;

    // When opcode is 0 and we have to look at the function
    // Since we dont have any R types do we need these?
    parameter JR_f = 6'h08;
    parameter ADD_f = 6'h20;
    parameter SLT_f = 6'h2a;
    parameter SUB_f = 6'h22;


 always @(*) begin 
 	case(opcode)
 		LW: begin
 			jump = 1;
 			branch = 1;
 			mem_read = 1;
 			mem_write = 1;
 			alu_src = 1;
 			reg_write = 1;
 			sign_or_zero = 1;
 			memToReg = 0;
 			regDst = 0;
 		end
 		SW: begin
 			jump = 1;
 			branch = 1;
 			mem_read = 1;
 			mem_write = 1;
 			alu_src = 1;
 			reg_write = 1;
 			sign_or_zero = 1;
 			memToReg = 0;
 			regDst = 0;
 		end
 		J: begin
 			jump = 1;
 			branch = 1;
 			mem_read = 1;
 			mem_write = 1;
 			alu_src = 1;
 			reg_write = 1;
 			sign_or_zero = 1;
 			memToReg = 0;
 			regDst = 0;
 		end
 		JAL: begin
 			jump = 1;
 			branch = 1;
 			mem_read = 1;
 			mem_write = 1;
 			alu_src = 1;
 			reg_write = 1;
 			sign_or_zero = 1;
 			memToReg = 0;
 			regDst = 0;
 		end
 		BEQ: begin
 			jump = 1;
 			branch = 1;
 			mem_read = 1;
 			mem_write = 1;
 			alu_src = 1;
 			reg_write = 1;
 			sign_or_zero = 1;
 			memToReg = 0;
 			regDst = 0;
 		end
 		BNE: begin
 			jump = 1;
 			branch = 1;
 			mem_read = 1;
 			mem_write = 1;
 			alu_src = 1;
 			reg_write = 1;
 			sign_or_zero = 1;
 			memToReg = 0;
 			regDst = 0;
 		end
 		XORI: begin
 			jump = 1;
 			branch = 1;
 			mem_read = 1;
 			mem_write = 1;
 			alu_src = 1;
 			reg_write = 1;
 			sign_or_zero = 1;
 			memToReg = 0;
 			regDst = 0;
 		end
  		ADDI: begin
 			jump = 1;
 			branch = 1;
 			mem_read = 1;
 			mem_write = 1;
 			alu_src = 1;
 			reg_write = 1;
 			sign_or_zero = 1;
 			memToReg = 0;
 			regDst = 0;
 		end
 end

 endmodule
