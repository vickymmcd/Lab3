# test to check JAL, LW, SW, and JR

start:
	li $t1, 3
	li $t2, 0
	# store the word in register $t1 into RAM at address contained in $t2-100
	sw $t1, -100($t2)
	jal get_val
	# add 5 to the val loaded in from memory
	addi $a0, $t3, 5
	j end
	
get_val:
	lw $t3, -100($t2)
	# jump back to where we were before jal
	jr $ra
	
end:
	j end