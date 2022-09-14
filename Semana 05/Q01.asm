# Contador de dígitos
.data
.text
.globl main

main:
    li $v0, 5
    syscall
    move $a0, $v0
    jal digitCount

    # Para contar quantos dígitos iguais a um determinado número, basta dividir por 10 e verificar o resto

    move $a0, $v0
    li $v0, 1
    syscall

end:
    li $v0, 10
    syscall

digitCount:
    # Salvar variáveis na pilha:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Função:
    li $v0, 0
    beq $a0, $zero, endDigitCount
    li $t0, 10
    div $a0, $t0    
    mflo $a0         #(carrega o resultado da divisão para $a0)
    jal digitCount
    add $v0, $v0, 1
    
    # Restaurar variáveis:
    endDigitCount:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
