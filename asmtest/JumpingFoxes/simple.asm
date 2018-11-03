start:
	addi $a0, $zero, 4
	beq $a0, 4, second
	addi $v0, $zero 1

test:
	add $v0, $a0, $zero

second:
	add $v0, $a0, $zero
	j end

end:
	j end