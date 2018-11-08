# test to check JAL, LW, SW, and JR

start:
	addi $t1, $zero, 3
	# set the value of $sp to be the top of the stack
	addi $sp, $zero, 0x3ffc
	# store the word in register $t1 into RAM at address contained in $sp+4
	sw $t1, 4($sp)
	jal get_val
	# add 5 to the val loaded in from memory
	addi $a0, $t3, 5
	j end
	
get_val:
	lw $t3, 4($sp)
	# jump back to where we were before jal
	jr $ra
	
end:
	j end
