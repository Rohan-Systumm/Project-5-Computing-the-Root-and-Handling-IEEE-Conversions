.text
.globl main

main:

li $t0, 0x3F800000 #A=1
li $t1, 0xC0400000 #B= -3
li $t2, 0x40000000 #C=2
li $t8, 0x40400000 #-B= +3
li $t3, 0x10010100

sw $t0, 0($t3)
sw $t1, 4($t3)
sw $t2, 8($t3)
sw $t8, 12($t3)

lwc1 $f0, 0($t3) #A=1
lwc1 $f1, 4($t3) #B=-3
lwc1 $f2, 8($t3) #C=2
lwc1 $f8, 12($t3) #-B =+3

mul.s $f3,$f2,$f2 # 2X2=4 for 4ac
mul.s $f3,$f3,$f2 # 4x2x1=4AC=8
mul.s $f6,$f1,$f1 # B^2 = 9

sub.s $f7,$f6,$f3 # B^2-4AC = 1

sqrt.s $f7,$f7 #Root of the Discriminant
 
sub.s $f5,$f8,$f7 #-B - Discriminant
div.s $f5,$f5,$f2 #-B - Discriminant / 2A = The First Root Ben Stokes

add.s $f4, $f8,$f7 #-B + Discriminant
div.s $f4, $f4,$f2 #-B + Discriminant / 2A = The 2nd Root Cutiye



li $v0,10
syscall