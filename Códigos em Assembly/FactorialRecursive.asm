.data
.text
.globl main

# Tentativa 1

main:
    li $v0, 5       # Colocar em $v0 o código para ler inteiro de input do usuário
    syscall
    move $a0, $v0   # $a0 = $v0

    jal fat

    li $v0, 1
    syscall

    j end

fat:
    addi $sp, $sp, -4       # Salvando o endereço:
    sw $ra, 0($sp)          

    addi $sp, $sp, -4       # Salvando o valor de n:
    sw $a0, 0($sp)      
    
        

end:
    li $v0, 10
    syscall