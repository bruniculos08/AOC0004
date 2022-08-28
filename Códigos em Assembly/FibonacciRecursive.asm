# int fib(int n) { 
#   if(n <= 1) return 1;
#    else return fib(n-1) + fib(n-2);
#

.text
.globl main
    main:
        li $v0, 5               # scanf("%i", n);  
        syscall

        add $a0, $zero, $v0     # Guardaremos o argumento da função em $a0 
        li $s0, 0               # Utilizaremos $s0 para guardar o resultado

        jal fib

        li $v0, 1               # printando o resultado de fib(n)
        add $a0, $zero, $s0
        syscall

        li $v0, 10              # Encerramento
        syscall

    fib:
        li $t0, 2
        blt $a0, $t0 useJrFib

        addi $sp, $sp, -4       # Alocando espaço para um int de 16 bits na pilha
        sw $ra, 0($sp)          # Guardando o endereço de retorna para a função que chamou

        addi $sp, $sp, -4       # Alocando espaço para um int de 16 bits na pilha
        sw $a0, 0($sp)          # Guardando o valor de n na execução atual

        addi $a0, $a0, -1       # fib(n-1)
        jal fib

        lw $a0, 0($sp)          # Recuperando o valor do argumento (n) na função atual 

        add $a0, $a0, -2
        jal fib

        addi $sp, $sp, 4        # Desempilhando o argumento da atual função na pilha

        add $t0, $zero, $sp
        addi $sp, $sp, 4        # Desempilhando o endereço da função anterior na pilha

        jr $t0                  # Retorna pra função anterior


    useJrFib:
        addi $s0, $s0, 1             # Quando se chega em um caso base o retorno é igual à 1
        jr $ra
