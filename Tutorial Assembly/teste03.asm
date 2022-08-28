.data
    jumpLine: .asciiz "\n"
.text
.globl main

main:
    addi $a0, $zero, 0
    
    li $v0, 1
    syscall

    jal jumpFunc

    nor $a0, $zero, $zero

    li $v0, 1
    syscall
    
    jal jumpFunc
    
    ori $a0, $zero, 65536
    
    li $v0, 1
    syscall

    li $v0, 10
    syscall
    
jumpFunc:
    la $a0, jumpLine
    li $v0, 4
    syscall
    jr $ra
	
