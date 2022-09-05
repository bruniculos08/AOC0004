.data
    jumpLine: .asciiz "\n"
    resultado: .asciiz "Resultado: "
    antigos0: .asciiz "Antigo $s0: "
.text
.globl main

main:
    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 5
    syscall
    move $s1, $v0

    li $v0, 5
    syscall
    move $s2, $v0

    li $v0, 5
    syscall
    move $s3, $v0

    li $v0, 5
    syscall
    move $s4, $v0

    li $v0, 5
    syscall
    move $s5, $v0

    jal leaf_exemple

    move $a0, $v0
    li $v0, 1
    syscall

    la $a0, jumpLine
    li $v0, 4
    syscall

    move $a0, $s0
    li $v0, 1
    syscall

end:
    li $v0, 10
    syscall

leaf_exemple:
    # Reservar 6 espaços de 4 bytes na pilha (6*4 = 24)...
    # ... para guardar os valores da função chamadora:
    addi $sp, $sp, -24
    sw $s0, 0($sp)  # valor de g
    sw $s1, 4($sp)  # valor de h
    sw $s2, 8($sp)  # valor de i
    sw $s3, 12($sp) # valor de j
    sw $s4, 16($sp) # valor de k
    sw $s5, 20($sp) # valor de z

    add $s0, $s0, $s1 # $s0 = g+h
    add $s1, $s2, $s3 # $s1 = i+j
    add $s2, $s4, $s5 # $s2 = k + z

    sub $s0, $s0, $s1 # $s0 = $s0 - $s1 <-> $s0 = (g+h) - (i+j)
    
    li $t0, 2
    mul $s2, $s2, $t0 # $s0 = $s0*$t0 = $s0*2 <-> $s0 = 2*(k+z)

    add $v0, $s0, $s2 # $v0 = $s0 + $s2 <-> (g+h) - (i+j) + 2*(k+z)

    # Agora que o valor de retorno já está em $v0 basta...
    # ... restaurar o valor dos registradores armazenados...
    # ... na pilha:

    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    lw $s4, 16($sp)
    lw $s5, 20($sp)
    addi $sp, $sp, 24

    jr $ra




