.data
.text
.globl main

main:

    # Recebendo argumento 1:
    li $v0, 5
    syscall
    move $a0, $v0

    # Recebendo argumento 2: 
    li $v0, 5
    syscall
    move $a1, $v0

    jal biggestNum

    move $a0, $v0

    li $v0, 1
    syscall

end:
    li $v0, 10
    syscall

biggestNum:

    bgt $a1, $a0 else_1

    if_1:
        move $v0, $a0
        j end_if_1

    else_1:
        move $v0, $a1
        
    end_if_1:
        jr $ra