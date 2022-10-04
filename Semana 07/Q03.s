# Traduzir o seguinte programa em C para MIPS assembly:
# int sum(int x) {
#     if (x == 0)
#         return 0;
#     return x + sum(x-1);
# }

# int main() {
#     int a;
#     scanf("%i", &a);
#     a = sum(a);
#     printf("%i\n", a);
#     return 0;
# }

.data
    jumpLine: .asciiz "\n"

.text
.globl main

main: 
    li $v0, 5
    syscall
    move $s0, $v0 # (1) atribui a $a0 o inteiro vindo de scanf

    move $a0, $s0 # (2) como iremos passar o valor como um argumento devemos utilizar o registrado $a0
    jal sum
    move $s0, $v0 # (3) a = sum(a)

    li $v0, 1
    move $a0, $s0 # (4) o inteiro a ser printado deve estar em $a0
    syscall

    li $v0, 4
    la $a0, jumpLine # (5) para printar uma string o endereço da string deve estar em $a0
    syscall

end:
    li $v0, 10
    syscall

sum:
    # Salvar variáveis:
    addi $sp, $sp, -8
    sw $s0, 0($sp)
    sw $ra, 4($sp)

    li $v0, 0               # Como se trata de uma soma de recursões devemos zerar $v0 antes de realizar as somas e...
                            # ... também perceba que zerar $v0 não interfere nas próximas chamadas visto que estas.. 
                            # ... farão o mesmo antes de se iniciar a soma a partir da chamada do caso base (folha).

    # Função
    move $s0, $a0
    beq $zero, $a0, stopSum # Note que primeiro se verifica se o argumento é 0 e depois se faz a chamada com decremento de 1
    addi $a0, $a0, -1    
    
    jal sum
    add $v0, $v0, $s0

    stopSum: 
    # Restaurar variáveis
    lw $s0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    jr $ra