    .data
argumentNumber: .word 0
resultNumber: .word 0

    .text
    .globl main

main:
    li $v0, 5               # Colocar em $v0 o código para ler inteiro de input do usuário
    syscall                 # Chamar sistema operacional
    jal factorial           # Pula para a função de label "factorial" voltando para a mesma linha após a execução da função
    add $a0, $v0, $zero
    li $v0, 1
    syscall

factorial:
    add $s1, $zero, $v0     # Colocar em $1 o valor de $v0
    add $s2, $zero, $v0     # Colocar em $1 o valor de $v0
    jal factorialAux
    add $v0, $zero, $v1

factorialAux:
    addi $s2, $s2, -1          # $s2 = $s2-1
    mul $s1, $s1, $s2          # $s1 = $s1*$s2
    bgt $s2, 1, factorialAux   # if($s2 >= 0) factorial();
    add $v1, $zero, $s1 

end:
    add $a0, $v0, $zero
    li $v0, 1
    syscall