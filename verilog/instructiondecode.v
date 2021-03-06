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
`define ADDIU 6'b001001   

`define XOR  6'b100110

`define alu_add  3'd0
`define alu_sub  3'd1
`define alu_xor  3'd2
`define alu_slt  3'd3

`define RTypeFlag  6'b000000


    // When opcode is 0 and we have to look at the function
    // Since we dont have any R types do we need these?
`define JR_f  6'b001000
`define ADD_f  6'h20
`define SLT_f  6'h2a
`define SUB_f  6'h22



module instructiondecode( 
	input[5:0] Op,
    input[5:0] funct,
    //input[5:0] function, // Not sure if needed
    
    output reg[2:0] alu_src,
    output reg[1:0] regDst,
    output reg jump,jumpLink, jumpReg, branchatall, bne,mem_write,alu_control,reg_write, memToReg                      
);

	//Instructions: LW, SW, J, JR, JAL, BEQ, BNE, XORI, ADDI, ADD, SUB, SLT
    // Link: http://alumni.cs.ucr.edu/~vladimir/cs161/mips.html

always @(Op) begin 
    case(Op)
        `LW: begin
            jump = 0;
            jumpReg = 0;
            branchatall = 0;
            jumpLink =0;
            bne = 0;
            alu_src = `alu_add;
            alu_control = 0; // use imm
            reg_write = 1; // write to reg
            mem_write = 0;
            memToReg = 1;  // use data output
            regDst = 2'b00; // put in rt     
        end
        `SW: begin
            jump = 0;
            jumpReg = 0;
            branchatall = 0;
            jumpLink =0;
            bne = 0;
            alu_src = `alu_add;
            alu_control = 0;
            reg_write =0;
            mem_write = 1;
            memToReg = 0;
            regDst = 2'b00;  // x,dosent matter
        end
        `J: begin
            jump = 1;
            jumpReg = 0;
            branchatall = 0;
            jumpLink =0;
            bne = 0;
            alu_src = `alu_add; // dosent matter
            alu_control = 0;
            reg_write = 0;
            mem_write = 0;
            memToReg = 0;
            regDst = 2'b00; // dosent matter 
        end
        `JAL: begin
            jump = 1;
            jumpReg = 0;
            branchatall = 0;
            jumpLink =1;
            bne = 0;
            alu_src = 000; // dosent matter
            alu_control = 1;
            reg_write = 1;
            mem_write = 0;
            memToReg = 1;
            regDst = 2'b11;     
        end
        `BEQ: begin
            jumpReg = 0;
            jump = 0;
            branchatall = 1;
            jumpLink =0;
            bne = 0;
            alu_src = `alu_sub;
            alu_control = 1;
            reg_write = 0;
            mem_write = 0;
            memToReg = 0;
            regDst = 2'b00; // selecting RD instead
        end
        `BNE: begin
            jumpReg = 0;
            jump = 0;
            branchatall = 1;
            jumpLink =0;
            bne = 1;
            alu_src = `alu_sub;
            alu_control = 1;
            reg_write = 0;
            mem_write = 0;
            memToReg = 0;
            regDst = 2'b00; 
        end
        `XORI: begin
            jump = 0;
            jumpReg = 0;
            branchatall = 0;
            jumpLink =0;
            bne = 0;
            alu_src = `alu_xor;
            alu_control = 0;
            reg_write = 1;
            mem_write = 0;
            memToReg = 0;
            regDst = 2'b00; 
        end
        `ADDI: begin
            jump = 0;
            branchatall = 0;
            jumpLink =0;
            bne = 0;
            alu_src = `alu_add;
            alu_control = 0;
            reg_write = 1;
            mem_write = 0;
            memToReg = 0;
            regDst = 0; 
            jumpReg = 2'b00;
        end
        `ADDIU: begin
            jump = 0;
            branchatall = 0;
            jumpLink =0;
            bne = 0;
            alu_src = `alu_add;
            alu_control = 0;
            reg_write = 1;
            mem_write = 0;
            memToReg = 0;
            regDst = 0; 
            jumpReg = 02'b00;
        end
        `RTypeFlag: begin
            case(funct)
                `JR_f: begin
                    jump = 0;
                    jumpReg = 1;
                    branchatall = 0;
                    jumpLink =0;
                    bne = 0;
                    alu_src = `alu_sub;
                    alu_control = 0;
                    reg_write = 0;
                    mem_write = 0;
                    memToReg = 0;
                    regDst = 2'b00; 
                end
                `ADD_f: begin
                    jump = 0;
                    jumpReg = 0;
                    branchatall = 0;
                    jumpLink =0;
                    bne = 0;
                    alu_src = `alu_add;
                    alu_control = 1;
                    reg_write = 1;
                    mem_write = 0;
                    memToReg = 0;
                    regDst = 2'b01; 
                end
                `SLT_f: begin
                    jump = 0;
                    jumpReg = 0;
                    branchatall = 0;
                    jumpLink =0;
                    bne = 0;
                    alu_src = `alu_slt;
                    alu_control = 1;
                    reg_write = 1;
                    mem_write = 0;
                    memToReg = 0;
                    regDst = 2'b01;
                end
                `SUB_f: begin
                    jump = 0;
                    jumpReg = 0;
                    branchatall = 0;
                    jumpLink =0;
                    bne = 0;
                    alu_src = `alu_sub;
                    alu_control = 1;
                    reg_write = 1;
                    mem_write = 0;
                    memToReg = 0;
                    regDst = 2'b01;
                end
            endcase
        end
    endcase

end

endmodule


        // `ADD: begin
        //     jump = 0;
        //     jumpReg = 0;
        //     branchE = 0;
        //     jumpLink =0;
        //     branchNE = 0;
        //     alu_src = `alu_add;
        //     alu_control = 1;
        //     reg_write = 1;
        //     mem_write = 0;
        //     memToReg = 0;
        //     regDst = 1; 
        // end

        // `SUB: begin
        //     jump = 0;
        //     jumpReg = 0;
        //     branchE = 0;
        //     jumpLink =0;
        //     branchNE = 0;
        //     alu_src = `alu_sub;
        //     alu_control = 1;
        //     reg_write = 1;
        //     mem_write = 0;
        //     memToReg = 0;
        //     regDst = 1; 
        // end
        // `SLT: begin
        //     jump = 0;
        //     jumpReg = 0;
        //     branchE = 0;
        //     jumpLink =0;
        //     branchNE = 0;
        //     alu_src = `alu_sub;
        //     alu_control = 1;
        //     reg_write = 1;
        //     mem_write = 0;
        //     memToReg = 0;
        //     regDst = 1; 
        // end