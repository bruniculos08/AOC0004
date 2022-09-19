# Função de fibonacci recursiva
.data
    jumpLine: .ascii "\n"
.text
.globl main

main:
    li $v0, 5
    syscall
    move $a0, $v0

    
    jal callFibonacci

end:
    li $v0, 10
    syscall

callFibonacci:
    li $v0, 0
    jal fibonacci
    jr $ra

fibonacci:
    # Salvar variáveis:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $s0, 8($sp)

    # Função:
    li $t0, 2
    testEqual2:
    bne $a0, $t0, testEqual1
    addi $v0, $v0, 2
    j endFibonacci

    testLessOrEqual1: 
    li $t0, 1
    bgt $a0, $t1, moreThan2
    addi $v0, $v0, 1
    j endFibonacci


    moreThan2:
    addi $a0, $a0, -1   # fibonacci(n-1)
    jal fibonacci
    addi $a0, $a0, -1   # fibonacci(n-2
    jal fibonacci

    endFibonacci:
    # Restaurar variáveis:
    lw $s0, 8($sp)
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 12
    