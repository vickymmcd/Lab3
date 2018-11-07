
start:
addi $a0, $zero, 2
addi $a1, $zero, 4
jal second
addi $v0 $v0 10
j end

third:
add $v0, $a0, $a1
jr $ra

second:
sw    $ra, 3($sp)
sw    $s0, 4($sp)
sw    $s1, 5($sp)
sw    $s1, 6($sp)

addi $a2, $a0, 5
jal third

lw    $s1, 0($sp)	

addi $v0 $v0 3 
jr $ra

end:
j end


#begin:
#	addi $a0, $zero, 10
#	addi $a1, $zero, 20
#	sw 
#	lw $a1, 0($0) # pop value in a0
#	lw $a2, 4($0) # load value in a0
