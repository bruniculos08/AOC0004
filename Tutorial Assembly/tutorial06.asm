.text
.globl main

main:
    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 5
    syscall
    move $s1, $v0
    
    slt $s2, $s1, $s0
    beq $s2, $zero, outIf  
    addi $s0, $s0, 30
outIf:
    addi $s1, $s1, 10

    move $a0, $s0
    li $v0, 1
    syscall

    move $a0, $s1
    li $v0, 1
    syscall

    li $v0, 10
    syscall

