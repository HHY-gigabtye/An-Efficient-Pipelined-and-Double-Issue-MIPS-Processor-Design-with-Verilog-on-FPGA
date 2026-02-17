li $s0,8
sw $s0,0($sp)
li $s0,7
sw $s0,4($sp)
li $s0,6
sw $s0,8($sp)
li $s0,5
sw $s0,12($sp)
li $s0,4
sw $s0,16($sp)
li $s0,3
sw $s0,20($sp)
li $s0,2
sw $s0,24($sp)
li $s0,1
sw $s0,28($sp)

move $t1,$sp

loop:
addi $t2,$t1,4

sort:
sub $t3,$t2,4
lw $t6,0($t2)
lw $t7,0($t3)
slt $t8,$t7,$t6
beq $t8,0,change
bne $t8,0,exit1

change:
lw $t9,0($t2)
lw $t5,0($t3)
sw $t9,0($t3)
sw $t5,0($t2)
addi $t2,$t2,-4
beq $t2,0,exit1
j sort

exit1:
addi $t1,$t1,4
beq $t1,2147479576,exit2
j loop

exit2:
