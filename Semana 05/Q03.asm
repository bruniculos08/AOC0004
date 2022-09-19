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

    move $a0, $v0
    li $v0, 1
    syscall

end:
    li $v0, 10
    syscall

callFibonacci:
    # Salvar variáveis
    add $sp, $sp, -4
    sw $ra, 0($sp)

    # Essa função auxiliar é necessária para zerar $v0
    li $v0, 0
    jal fibonacci

    # Restaurar variáveis
    lw $ra, 0($sp)
    add $sp, $sp, 4

    jr $ra

fibonacci:
    # Salvar variáveis:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $a0, 4($sp)

    # Função:
    li $t0, 2
    bgt $a0, $t0, greaterThan2
    blt $a0, $t0, lessThan2

    equal2:
    addi $v0, $v0, 2
    j endFibonacci

    lessThan2:
    addi $v0, $v0, 1
    j endFibonacci

    greaterThan2:  
    addi $a0, $a0, -1 # fibonacci(n-1)
    jal fibonacci
    # Poderia restaurar o valor de $a0 aqui (seria um bom padrão pra se usar no compilador),...
    # ... então depois somando -2 no addi.
    addi $a0, $a0, -1 # fibonacci(n-2)
    jal fibonacci

    endFibonacci:
    # Restaurar variáveis:
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8
    
    jr $ra