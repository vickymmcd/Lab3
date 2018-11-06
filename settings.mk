# Project-specific settings

## Assembly settings

# Assembly program (minus .asm extension)
PROGRAM := $(toRun)
#NINJA/array_loop/array_loop
#NINJA/fib_func/fib_func
#JumpingFoxes/multiplyby3
#JumpingFoxes/simple

# Memory image(s) to create from the assembly program
TEXTMEMDUMP := $(PROGRAM).text.hex
DATAMEMDUMP := $(PROGRAM).data.hex


## Verilog settings

# Top-level module/filename (minus .v/.t.v extension)
TOPLEVEL := cpu

# All circuits included by the toplevel $(TOPLEVEL).t.v
CIRCUITS := $(TOPLEVEL).v #alu.v signextend.v addresslatch.v instructionwrapper.v regfile.v shiftregister.v regfileExtra.v signextendjump16.v branch.v
