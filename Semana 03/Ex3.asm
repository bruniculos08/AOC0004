.data
    jumpLine: .asciiz "\n"
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

    # Recebendo argumento 3: 
    li $v0, 5
    syscall
    move $a2, $v0

    # Chamando função:
    jal func

    move $a0, $v0
    li $v0, 1
    syscall

    move $a0, $v1
    li $v0, 1
    syscall

end:
    li $v0, 10
    syscall

func:

    # Fazer como um vetor {$a0, $a1, $a2}

    move $v0, $a0
    move $v1, $a1

    bgt $v1, $v0, v1maiorv0

    v0maiorv1:
        bgt $a2, $v0 a2maiorv0
        bgt $v1, $a2 a2menorv1
        j end_func

    v1maiorv0:
        move $t1, $v0
        move $t0, $v1
        move $v1, $t1
        move $v0, $t0

        j v0maiorv1

    a2maiorv0:
        move $v0, $a2
        j end_func

    a2menorv1:
        move $v1, $a2
        #j end_func

    end_func:
        jr $ra


    # tem que retornar o menor também! (arrumar)
    # $v0 = maior
    # $v1 = menor

