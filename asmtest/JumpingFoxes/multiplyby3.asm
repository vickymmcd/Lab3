# compute 3*n by doing n+n+n

addi $t1, $zero, 4

add $t2,$t1,$t1 # add 4+4
add $a0,$t2,$t1 # add the third 4