# if ((a < b && b < 50) || a == -10) {
#      vet[b] = vet[b] + vet[b - 20];
# } else {
#      a = 50;
# }
# b++;

.data
    vetor: .word 1 2 3 4
.text
.globl main

main: 
    li $s0, 1       # int a = 0
    li $s1, 0       # int b = 0
    la $s2, vetor   # int vetor[0]


    bge $s0, $s1, orCondition  # if(a >= b) go to orCondition
    li $t0, 50
    bge $s1, $t0, orCondition  # if(b <= 50) go to orCondition

if:
    sll $t0, $s1, 2     # $t0 = 4*b
    addi $t1, $s1, -20
    sll $t1, $t1, 2     # $t1 = 4*(b-20)

    add $t0, $t0, $s2   # $t0 = vetor+b
    add $t1, $t1, $s2   # $t1 = vetor+b-20 

    lw $t3, 0($t0)      # $t3 = *(vetor+b)
    lw $t4, 0($t1)      # $t4 = *(vetor+b-20)    

    add $t2, $t3, $t4   # $t2 = *(vetor+b) + *(vetor+b-20)  
    sw $t2, 0($t0)      # *(vetor+b) = $t2

    j out

orCondition:
    li $t0, -10     
    beq $s0, $t0, if    # if(a == -10) go to if code

else:
    li $s0, 50          # a = 50

out:
    addi $s1, $s1, 1    # b = b + 1

    move $a0, $s0       # printf("%i", a);
    li $v0, 1
    syscall

    li $v0, 10
    syscall