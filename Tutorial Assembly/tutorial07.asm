.data
    vetor: .word 1 
    .word 1 
    .word 1 
    .word 4
.text
.globl main

main:
    la $s6, vetor      # endereço de início do vetor
    li $s3, 1          # valor k
    li $s5, 0          # valor i 
while:
    sll $t0, $s5, 2            # $t0 = 4 * $s5
    add $t1, $s6, $t0          # $t1 = (vetor + i*4)
    lw $t3, 0($t1)
    bne $t3, $s3, outWhile
    addi $s5, $s5, 1
    j while
outWhile:
    addi $t2, $s3, 10
    sw $t2, 0($t1)     

    li $v0, 1
    lw $t3, 0($t1)
    move $a0, $t3
    syscall


