.data
    newLine: .asciiz "\n"

.text
.globl main

main: 
    addi $s0, $zero, 10

    # (1) Printar o valor:
    move $a0, $s0		    # $a0 = $s0 (move conteúdo de um registrador para outro)
    li, $v0, 1
    syscall

    # (1.1) Printar nova linha:
    la $a0, newLine
    li, $v0, 4
    syscall

    # Pulando para a função increaseRegister:
    jal increaseRegister    

    # (1.2) Printar nova linha:
    la $a0, newLine
    li, $v0, 4
    syscall

    # (1.3) Printar o valor:
    move $a0, $s0		    # $a0 = $s0 (move conteúdo de um registrador para outro)
    li, $v0, 1
    syscall

    # Final do programa:
    li, $v0, 10
    syscall

increaseRegister:
    # (2) Alocando um espaço na pilha (a pilha cresce de endereços maiores para menores sendo que...
    # ... cada endereço aloca 1 byte (8 bits) portanto para salvar um inteiro subtraímos 4 do endereço...
    # ... dado que um inteiro possui 32 bits):
    addi $sp, $sp, -4

    # (2.1) Salvando o valor da variável $s0 no primeiro lugar apontado pelo endereço em $sp (stack pointer):
    # - obs.: 0 é o deslocamento em bytes em relação ao endereço passado.
    sw $s0, 0($sp)
    
    # (3) Alterando o valor de $s0 temos:
    addi $s0, $s0, 30

    # (4) Printando o valor de $s0 na função increaseRegister:
    li, $v0, 1
    move $a0, $s0
    syscall

    # (5) Recuperando o antigo valor de $s0 para a função main e "desempilhando" (atualizando o topo da pilha):
    lw $s0, 0($sp)
    addi $sp, $sp, 4

    # (6) Voltar para a função main:
    jr $ra
