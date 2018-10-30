`timescale 1ns/1ps

`define LW  6'b100011 // Type: I
`define SW  6'b101011
`define J  6'b000010 // Type: J
//`define JR 6'b001000
`define JAL  6'b000011 // Type: J -> Jump and Link
`define BEQ  6'b000100 // Type: I
`define BNE  6'b000101 // Type: I
`define XORI  6'b001110 // Type: I
`define ADDI 6'b001000 // Type: I

`define ADD  6'b100000 // Type: R
`define SUB 6'b100010 // Type: R
`define SLT  6'b101010 // Type: R

`define XOR  6'b100110

`define alu_add  3'd0
`define alu_sub  3'd1
`define alu_xor  3'd2
`define alu_slt  3'd3


    // When opcode is 0 and we have to look at the function
    // Since we dont have any R types do we need these?
`define JR_f  6'b111111 // FIX THIS!!
`define ADD_f  6'h20
`define SLT_f  6'h2a
`define SUB_f  6'h22



module instructiondecode( 
	input[5:0] Op,  
    //input[5:0] function, // Not sure if needed
    
    output reg[2:0] alu_src,
    output reg jump,jumpLink, jumpReg, branchE, branchNE,mem_write,alu_control,reg_write, regDst, memToReg                      
);

	//Instructions: LW, SW, J, JR, JAL, BEQ, BNE, XORI, ADDI, ADD, SUB, SLT
    // Link: http://alumni.cs.ucr.edu/~vladimir/cs161/mips.html


// VALUES ARE NOT SET YET 
always @(Op) begin 
    case(Op)
        `LW: begin
            jump = 0;
            jumpReg = 0;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = `alu_add;
            alu_control = 1;
            reg_write = 0;
            mem_write = 0;
            memToReg = 1;
            regDst = 1;     
        end
        `SW: begin
            jump = 0;
            jumpReg = 0;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = `alu_add;
            alu_control = 1;
            reg_write = 1;
            mem_write = 1;
            memToReg = 0;
            regDst = 0;  // x,dosent matter
        end
        `J: begin
            jump = 1;
            jumpReg = 0;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = 000; // dosent matter
            alu_control = 1;
            reg_write = 0;
            mem_write = 0;
            memToReg = 1;
            regDst = 1; 
        end
        `JR_f: begin
            jump = 1;
            jumpReg = 1;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = 000; // dosent matter
            alu_control = 1;
            reg_write = 0;
            mem_write = 0;
            memToReg = 1;
            regDst = 1; 
        end
        `JAL: begin
            jump = 1;
            jumpReg = 0;
            branchE = 0;
            jumpLink =1;
            branchNE = 0;
            alu_src = 000; // dosent matter
            alu_control = 1;
            reg_write = 1;
            mem_write = 0;
            memToReg = 1;
            regDst = 1;     
        end
        `BEQ: begin
            jumpReg = 0;
            jump = 0;
            branchE = 1;
            jumpLink =0;
            branchNE = 1;
            alu_src = `SUB;
            alu_control = 1;
            reg_write = 1;
            mem_write = 0;
            memToReg = 1;
            regDst = 1; 
        end
        `BNE: begin
            jumpReg = 0;
            jump = 0;
            branchE = 1;
            jumpLink =0;
            branchNE = 1;
            alu_src = `SUB;
            alu_control = 1;
            reg_write = 1;
            mem_write = 0;
            memToReg = 1;
            regDst = 1; 
        end
        `XORI: begin
            jump = 0;
            jumpReg = 0;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = `XOR;
            alu_control = 0;
            reg_write = 1;
            mem_write = 0;
            memToReg = 0;
            regDst = 0; 
        end
        `ADDI: begin
            jump = 0;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = `alu_add;
            alu_control = 0;
            reg_write = 1;
            mem_write = 0;
            memToReg = 0;
            regDst = 0; 
            jumpReg = 0;
        end
        `ADD: begin
            jump = 0;
            jumpReg = 0;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = `ADD;
            alu_control = 1;
            reg_write = 1;
            mem_write = 0;
            memToReg = 0;
            regDst = 1; 
        end

        `SUB: begin
            jump = 0;
            jumpReg = 0;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = `SUB;
            alu_control = 1;
            reg_write = 1;
            mem_write = 0;
            memToReg = 0;
            regDst = 1; 
        end
        `SLT: begin
            jump = 0;
            jumpReg = 0;
            branchE = 0;
            jumpLink =0;
            branchNE = 0;
            alu_src = `SUB;
            alu_control = 1;
            reg_write = 1;
            mem_write = 0;
            memToReg = 0;
            regDst = 1; 
        end
    endcase

end

endmodule
