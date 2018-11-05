start:
	addi $a0, $zero, 2
	addi $a1, $zero, 3737
	addi $a2, $zero, 4
	j end
	addi $a2, $zero, 4747

next:
	addi $a2, $a0, 34
	addi $a2, $a0, 5
	addi $a2, $a0, 5
	addi $a2, $a0, 5
	addi $a2, $a0, 5
	j last

last:
	addi $a4, $zero, 120
	add $v0, $a0, $a1
	xori $v3, $a0, 30
	xori $v4, $a0, 23
	xori $v5, $a0, 1

	j end

end:
	j end