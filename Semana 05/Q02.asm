# Somador dos dígitos de um número
.data
    jumpLine: .ascii "\n"
.text
.globl main

main:
    # Para realizar a soma dos dígitos de um número n (inteiro) basta dividir por 10, e:
    # a) se n/10 = 0 então soma = soma + resto
    # b) se n/10 > 0 então soma = soma + resto + soma dos dígitos do quociente
    # Ou seja, se o quociente for maior que 0 a recursão deve continuar, caso contrário não.

    while:

    li $v0, 5
    syscall
    move $a0, $v0

    beq $a0, $zero, end
    jal sumDigits

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

sumDigits:

    # Salvar variáveis:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $s0, 8($sp)

    li $v0, 0
    li $t0, 10
    div $a0, $t0
    mfhi $s0        # $s0 = resto
    mflo $a0        # $a0 = quociente  
    beq $a0, $zero, endSumDigits
    jal sumDigits


    endSumDigits:
    # Somar o resto:
    add $v0, $v0, $s0


    # Restaurar variáveis
    lw $s0, 8($sp)
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 12
    jr $ra