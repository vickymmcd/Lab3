`include "cpu.v"
`timescale 1ns/1ps
//------------------------------------------------------------------------
// Simple fake CPU testbench sequence
//------------------------------------------------------------------------

module cpu_test ();

    reg clk;
    reg reset;

    // Clock generation
    initial clk=0;
    always #10 clk = !clk;


    CPU cpu(.clk(clk), .reset(reset));

    // Filenames for memory images and VCD dump file
    reg [1023:0] mem_text_fn;
    reg [1023:0] mem_data_fn;
    reg [1023:0] dump_fn;
    reg init_data = 0;      // Initializing .data segment is optional

    // Test sequence
    initial begin

	// Get command line arguments for memory image(s) and VCD dump file
	//   http://iverilog.wikia.com/wiki/Simulation
	//   http://www.project-veripage.com/plusarg.php
	if (! $value$plusargs("mem_text_fn=%s", mem_text_fn)) begin
	    $display("ERROR: provide +mem_text_fn=[path to .text memory image] argument");
	    $finish();
        end
	if (! $value$plusargs("mem_data_fn=%s", mem_data_fn)) begin
	    $display("INFO: +mem_data_fn=[path to .data memory image] argument not provided; data memory segment uninitialized");
	    init_data = 0;
        end

	if (! $value$plusargs("dump_fn=%s", dump_fn)) begin
	    $display("ERROR: provide +dump_fn=[path for VCD dump] argument");
	    $finish();
        end

    $display(mem_text_fn);
	$dumpfile("CPUtestN.vcd");


	$readmemh(mem_text_fn, cpu.Dmem.memory, 0);
    	if (init_data) begin
    	$readmemh(mem_data_fn, cpu.Dmem.memory, 2048);
    	end
	$dumpvars();

	// Assert reset pulse
	reset = 0; #10;
	reset = 1; #10;
	reset = 0; #10;


	$display("PC | IMM  | ALUOutput | MemoryOutput | MEMORY input | Da  | Db  | reg input | branch ");
	repeat(25) begin

        $display("%4t | %b | %d | %d|  %d | %d | %d | %d | %d | %d ", $time,  cpu.instrwrpr.alu_control, cpu.Da , cpu.selB, cpu.extendedimm, cpu.Db, cpu.mux2.out,cpu.mux2.input1 , cpu.mux2.input1, cpu.alu_control); #20 ;

        end

	#2000;

	// Test Checks for each test file, only prints if test passed

	if(cpu.registerfile.register5 === 32'd120)begin
		$display("Simple Jump Passed");
	end

	if(cpu.registerfile.register4 === 32'd12)begin
		$display("Multiply By 3 Passed");
	end

	if(cpu.registerfile.register9 === 32'd365)begin
		$display("Simple LW and SW works");
	end

	if(cpu.registerfile.register10 === 32'd16 )begin
		$display("array_loop works"); // How to check memory, need to reserach sw and lw more
	end

	if(cpu.registerfile.register2 === 32'd58 )begin
		$display("Fibb test works"); // How to check memory, need to reserach sw and lw more
	end

	$display(cpu.registerfile.register0);
	$display(cpu.registerfile.register1);
	$display(cpu.registerfile.register2);
	$display(cpu.registerfile.register3);
	$display(cpu.registerfile.register4);
	$display(cpu.registerfile.register5);
	$display(cpu.registerfile.register6);
	$display(cpu.registerfile.register7);
	$display(cpu.registerfile.register8);
	$display(cpu.registerfile.register9);
	// $display(cpu.registerfile.register10);
	// $display(cpu.registerfile.register11);
	// $display(cpu.registerfile.register12);
	// $display(cpu.registerfile.register13);
	// $display(cpu.registerfile.register14);
	// $display(cpu.registerfile.register15);
	// $display(cpu.registerfile.register16);
	// $display(cpu.registerfile.register17);
	// $display(cpu.registerfile.register18);
	// $display(cpu.registerfile.register19);
	// $display(cpu.registerfile.register20);
	// $display(cpu.registerfile.register21);
	// $display(cpu.registerfile.register22);
	// $display(cpu.registerfile.register23);
	// $display(cpu.registerfile.register24);
	// $display(cpu.registerfile.register25);
	// $display(cpu.registerfile.register26);
	// $display(cpu.registerfile.register27);
	// $display(cpu.registerfile.register28);
	// $display(cpu.registerfile.register29);
	// $display(cpu.registerfile.register30);
	// $display(cpu.registerfile.register31);


	$finish();
    end

endmodule
