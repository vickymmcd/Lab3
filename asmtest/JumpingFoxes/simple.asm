start:
	addi $a0, $zero, 4
	bne $a0, 4, second
	addi $v0, $zero 1

test:
	addi $v0, $zero, 876

second:
	addi $v0, $zero, 28238
	j end

end:
	j end