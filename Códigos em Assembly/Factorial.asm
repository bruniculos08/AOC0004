    .text
    .globl main

main:
    li $v0, 5               # Colocar em $v0 o código para ler inteiro de input do usuário
    syscall                 # Chamar sistema operacional
    add $s1, $zero, $v0     # Colocar em $1 o valor de $v0
    add $s2, $zero, $v0     # Colocar em $1 o valor de $v0
    j factorial             # Pula para a função de label "factorial"

factorial:
    addi $s2, $s2, -1       # $s2 = $s2-1
    mul $s1, $s1, $s2       # $s1 = $s1*$s2
    bgt $s2, 1, factorial   # if($s2 >= 0) factorial();
    j end

end:
    li $v0, 1
    add $a0, $s1, $zero
    syscall
    li $v0, 10
    syscall
