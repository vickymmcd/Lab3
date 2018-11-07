start:
	addi $t0, $zero, 2
	addi $t1, $zero, 3
	j do_something

finish:
	add $a0, $t0, $t1

do_something:
	addi $t0, $t0, 6
	j finish
