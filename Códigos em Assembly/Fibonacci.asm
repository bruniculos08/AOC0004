.data
    jumpLine: .asciiz "\n\0"

.text
.globl main 

# Def. função de Fibonacci: 
#      n > 1 -> F(n) = F(n-1) + F(n-2)
#      n <= 1 -> F(n) = 1
# Obs.: Não fazer da forma recursiva (fazer de baixo para cima).

main:
    li $a0, 0       # $a0 vai guardar do resultado
    li $s0, 0       # $s0 é auxiliar
    li $s1, 1       # $s1 é auxiliar
    
    li $v0, 5       
    syscall         # $v0 recebe n (é contador para chegar no e-nésimo número de fibonacci)

    jal	fibonacci	# jump to target and save position to $ra
    
    li $v0, 1
    syscall
    j end

fibonacci:
    add $a0, $s0, $s1 
    add $s0, $zero, $s1
    add $s1, $zero, $a0
    addi $v0, $v0, -1
    bgt	$v0, $zero, fibonacci	# if $t0 > $t1 then target
    jr $ra

end:
    li $v0, 10
    syscall
