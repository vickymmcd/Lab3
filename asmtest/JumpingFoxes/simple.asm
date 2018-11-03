start:
	addi $a0, $zero, 2
	addi $a1, $zero, 3737
	addi $a2, $zero, 4
	j last
	addi $a2, $zero, 4747

last:
	add $v0, $a0, $a1
	xori $a3, $a0, 1
	j end

next:
	addi $a2, $a0, 5
	j last

end:
	j end