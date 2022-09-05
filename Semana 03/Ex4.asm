.data
.text
.globl main

main:
    li $v0, 5
    syscall
    move $a0, $v0
    
    jal digitNum

    move $a0, $v0
    
    li $v0, 1
    syscall

end:
    li $v0, 10
    syscall

digitNum:

    li $t0, 1    
    beq $a0, $zero, endDigitNum

    li $t0, 0
    li $t1, 10

    divideToZero:
        beq $a0, $zero, endDigitNum
        div $a0, $t1
        mflo $a0
        addi $t0, $t0, 1
        j divideToZero
    
    endDigitNum:        
        move $v0, $t0
        jr $ra