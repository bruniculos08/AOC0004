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

    # Recebendo argumento 3: 
    li $v0, 5
    syscall
    move $a2, $v0

    # Chamando função:
    jal func

    move $a0, $v0

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
        bgt $v1, $a0 a2menorv1
        j end func

    v1maiorv0:
        move $v0, $a1
    
    a2maiorv0:

    a2menorv1:

    

    bgt $a1, $a0 a1maior

    # tem que retornar o menor também! (arrumar)
    # $v0 = maior
    # $v1 = menor

