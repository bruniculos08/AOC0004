.text
.globl main

main:
    li $v0, 1
    li $a0, 20
    syscall

    addi $sp, $sp, -4
    sw $a0, 0($sp)
    
    jal callPrint

    lw $a0, 0($sp)

    li $v0, 1
    syscall
    li $v0, 10
    syscall

callPrint:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal print

    lw $t0, 0($sp)
    addi $sp, $sp, 4
    jr $t0

print:

    li $v0, 1
    li $a0, 99
    syscall

    jr $ra
