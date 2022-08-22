.data
    jumpLine: .asciiz "\n\0" 
    error: .ascii "\nERRO\0" 

    # Aviso: perguntar ao professor por que o print pega todas as strings após o endereço da string desejada (segundo...
    # ... a documentação isso não era pra acontecer.

    # Obs.: Pelo visto o problema relacionado ao aviso era a falta de "\0".

.text
    .globl main

main:
    li $a0, 0           # Zera o argumento pra função a ser chamada
    li $s1, 0
    jal sumAverage      # Pula para a função "sumAverage"


    li $v0, 1           # $v0 = 1 que é o código para printar o inteiro em $a0 (resultado da soma)
    syscall

    beq	$s1, $zero, errorMessege	# if $t1 == $zero then useLinker

    div $s0, $a0, $s1   # $s0 = $a0/$s1 (para printar a média)
    la $a0, jumpLine


    li $v0, 4           # $v0 = 4 que é o código para printar a string em $a0
    syscall

    add $a0, $zero, $s0 # $a0 = $s0 (para printar a média)

    li $v0, 1           # $v0 = 1 que é o código para printar o inteiro em $a0
    syscall

    j end


sumAverage:
    li $v0, 5                   # $v0 = 5
    syscall
    addi $t1, $v0, 1            # $t1 = $v0 + 1
    beq	$t1, $zero, useLinker	# if $t1 == $zero then useLinker
    addi $s1, $s1, 1            # $s3 = $s3 + 1
    add $a0, $a0, $v0           # $a0 = $a0 + $v0
    j sumAverage
    
useLinker:
    jr $ra                      # Pula para última função com "jal" (de endereço salvo em $ra)

errorMessege:
    la $a0, error
    li $v0, 4           # $v0 = 4 que é o código para printar a string em $a0
    syscall


end:
    li $v0, 10
    syscall