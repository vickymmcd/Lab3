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

// VALUES ARE NOT SET YET 
 always @(*) begin 
 	case(opcode)
 		LW: begin
 			jump = 0;
 			branchE = 0;
 			jumpLink =0;
 			branchNE = 0;
 			alu_src = alu_add;
 			alu_control = 1;
 			reg_write = 0;
 			mem_write = 0;
 			memToReg = 1;
 			regDst = 1;		
 		end
 		SW: begin
 			jump = 0;
 			branchE = 0;
 			jumpLink =0;
 			branchNE = 0;
 			alu_src = alu_add;
 			alu_control = 1;
 			reg_write = 1;
 			mem_write = 1;
 			memToReg = 0;
 			regDst = 0;	 // x,dosent matter
 		end
 		J: begin
 			jump = 1;
 			branchE = 0;
 			jumpLink =0;
 			branchNE = 0;
 			alu_src = xxx; // dosent matter
 			alu_control = 1;
 			reg_write = 0;
 			mem_write = 0;
 			memToReg = 1;
 			regDst = 1;	
 		JAL: begin
 			jump = 1;
 			branchE = 0;
 			jumpLink =1;
 			branchNE = 0;
 			alu_src = xxx; // dosent matter
 			alu_control = 1;
 			reg_write = 1;
 			mem_write = 0;
 			memToReg = 1;
 			regDst = 1;		
 		end
 		BEQ: begin
 			jump = 0;
 			branchE = 1;
 			jumpLink =0;
 			branchNE = 1;
 			alu_src = SUB;
 			alu_control = 1;
 			reg_write = 1;
 			mem_write = 0;
 			memToReg = 1;
 			regDst = 1;	
 		end
 		BNE: begin
 			jump = 0;
 			branchE = 1;
 			jumpLink =0;
 			branchNE = 1;
 			alu_src = SUB;
 			alu_control = 1;
 			reg_write = 1;
 			mem_write = 0;
 			memToReg = 1;
 			regDst = 1;	
 		end
 		XORI: begin
 			jump = 0;
 			branchE = 0;
 			jumpLink =0;
 			branchNE = 0;
 			alu_src = XOR;
 			alu_control = 0;
 			reg_write = 1;
 			mem_write = 0;
 			memToReg = 0;
 			regDst = 0;	
 		end
  		ADDI: begin
 			jump = 0;
 			branchE = 0;
 			jumpLink =0;
 			branchNE = 0;
 			alu_src = ADD;
 			alu_control = 0;
 			reg_write = 1;
 			mem_write = 0;
 			memToReg = 0;
 			regDst = 0;	
 		end
 		 ADD: begin
 			jump = 0;
 			branchE = 0;
 			jumpLink =0;
 			branchNE = 0;
 			alu_src = ADD;
 			alu_control = 1;
 			reg_write = 1;
 			mem_write = 0;
 			memToReg = 0;
 			regDst = 1;	
 		end

  		 SUB: begin
 			jump = 0;
 			branchE = 0;
 			jumpLink =0;
 			branchNE = 0;
 			alu_src = SUB;
 			alu_control = 1;
 			reg_write = 1;
 			mem_write = 0;
 			memToReg = 0;
 			regDst = 1;	
 		end
   		 SLT: begin
 			jump = 0;
 			branchE = 0;
 			jumpLink =0;
 			branchNE = 0;
 			alu_src = SUB;
 			alu_control = 1;
 			reg_write = 1;
 			mem_write = 0;
 			memToReg = 0;
 			regDst = 1;	
 		end
 end


 endmodule
