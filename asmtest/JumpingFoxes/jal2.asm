# test to check JAL and be

start:
	addi $t1, $zero, 3
	jal increment_val
	# add 5 to the val incremented to 10 in the loop below
  addi $a0, $t1, 2
	addi $a0, $t1, 5
	j end

increment_val:
	addi $t1, $t1, 1
  beq $t1, 10, move_on
  j increment_val

move_on:
	# jump back to where we were before jal
	jr $ra

end:
	j end
