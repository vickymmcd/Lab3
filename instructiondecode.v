module instructiondecode( 
	input[5:0] Op,  
    //input[5:0] function, // Not sure if needed
    
    output reg[2:0] alu_src,
    output reg jump,jumpLink, branchE, branchNE,mem_write,alu_control,reg_write, regDst, memToReg                      
);

	//Instructions: LW, SW, J, JR, JAL, BEQ, BNE, XORI, ADDI, ADD, SUB, SLT
    // Link: http://alumni.cs.ucr.edu/~vladimir/cs161/mips.html
    localparameter LW = 6'b100011; // Type: I
    localparameter SW = 6'b101011; // Type: I
    localparameter J = 6'b000010; // Type: J 
    localparameter JAL = 6'b000011; // Type: J -> Jump and Link
    localparameter BEQ = 6'b000100; // Type: I
    localparameter BNE = 6'b000101; // Type: I
    localparameter XORI = 6'b001110; // Type: I
    localparameter ADDI = 6'b001000; // Type: I

    // ALU Control mapping
    localparameter alu_add = 3'd0;
    localparameter alu_sub = 3'd1;
    localparameter alu_xor = 3'd2;
    localparameter alu_slt = 3'd3;

    // When opcode is 0 and we have to look at the function
    // Since we dont have any R types do we need these?
    localparameter JR_f = 6'h08;
    localparameter ADD_f = 6'h20;
    localparameter SLT_f = 6'h2a;
    localparameter SUB_f = 6'h22;

// VALUES ARE NOT SET YET 
always @(Op) begin 
    case(Op)
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
            regDst = 0;  // x,dosent matter
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
        end
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
    endcase

end

endmodule
