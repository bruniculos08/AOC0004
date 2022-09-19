# Contador de dígitos
.data
    jumpLine: .ascii "\n"
.text
.globl main

main:

    while:
    li $v0, 5
    syscall
    move $a0, $v0 # $a0 = n

    beq $a0, $zero, end

    li $v0, 5      
    syscall
    move $a1, $v0 # $a1 = k

    jal digitCount

    # Para contar quantos dígitos iguais a um determinado número k, basta dividir por 10 e verificar o resto e o quociente,...
    # ... ai se o resto for igual k, some 1 + quantidade de k no quosciente.

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, jumpLine
    syscall

    j while

end:
    li $v0, 10
    syscall

digitCount:
    # Salvar variáveis na pilha:
    addi $sp, $sp, -16
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $s0, 12($sp)

    # Função:
    li $v0, 0
    li $t0, 10
    div $a0, $t0 
    mflo $a0    # $a0 = 0
    mfhi $s0    # $s0 = 1
    beq $a0, $zero, verifyRest # (1) Se o quociente da divisão for 0 não continua a recursão
    jal digitCount
    verifyRest:
    bne $s0, $a1, endDigitCount # (2) Se o resto da divisão for igual à k, soma 1 no contador (retorno)
    addi $v0, $v0, 1
    
    # Restaurar variáveis:
    endDigitCount:
    lw $s0, 12($sp)
    lw $a1, 8($sp)
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 16
    jr $ra
