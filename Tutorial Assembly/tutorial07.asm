.data
    vetor: .word 1 .word 1 .word 1 .word 4
.text
.globl main

main:
    la $s6, vetor
    li $s3, 2
    li $s5, 0
while:
    jal cond
    beq $s6, $s3


