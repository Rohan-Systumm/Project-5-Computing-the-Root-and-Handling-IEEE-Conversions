.text
.globl main

main:

li $t0, 0x42c80000
li $t2, 0x10010000
sw $t0, 0($t2)
lwc1 $f0, 0($t2)
li $t1, 0x43af0000
li $t3, 0x10010100
sw $t1, 0($t3)
lwc1 $f1, 0($t3)
div.s $f2, $f1, $f0



li $v0,10
syscall