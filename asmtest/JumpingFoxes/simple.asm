start:
	addi $at, $zero, 2
	addi $v0, $zero, 3737
	j last
	addi $v1, $zero, 4747

next:
	add $a0, $at, 34
	j last

last:
	addi $a1, $zero, 120
	j end

end:
	j end
