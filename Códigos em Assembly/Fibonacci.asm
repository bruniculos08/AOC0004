.data
    jumpLine: "\n\0"

.text
.globl main

# Def. função de Fibonacci: 
#      n > 1 -> F(n) = F(n-1) + F(n-2)
#      n <= 1 -> F(n) = 1

main:
    li $a0, 0
    li $s1, 0
    li $s2, 0
    jal	fibonacci	# jump to target and save position to $ra
    
    li $v0, 1
    syscall

fibonacci:

fibonacci:
