.data
.text
.globl main

main:
    li $v0, 5       # Colocar em $v0 o código para ler inteiro de input do usuário
    syscall
    move $a0, $v0   # $a0 = $v0

    jal fat

    li $v0, 1
    syscall

    j end

fat:
    addi $sp, $sp, -4       # Salvando o endereço:
    sw $ra, 0($sp)          

    addi $sp, $sp, -4       # Salvando o valor de n:
    sw $a0, 0($sp)          

    addi $a0, $a0, -1

    jal useLinker

    lw $t0, 0($sp)
    mul $a0, $a0, $t0
    addi $sp, $sp, 4

    lw $t0, 0($sp)
    addi $sp, $sp, 4
 
    jr $t0

useLinker:
    bne $a0, 1, fat
    jr $ra              # O endereço  em $ra só vai ser usado para voltar a linha do "jal useLinker" quando n = 1

end:
    li $v0, 10
    syscall