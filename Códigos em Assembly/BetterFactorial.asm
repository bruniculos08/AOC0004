    .data

    .text
    .globl main

main:
    li $v0, 5               # Colocar em $v0 o código para ler inteiro de input do usuário
    syscall                 # Chamar sistema operacional

    jal factorial           # Pula para a função de label "factorial" salvando em $ra o endereço...
                            # ... para a instrução da próxima linha (valor que usaremos para retornar...
                            # ... a execução da função após a chamada de factorial).

    add $a0, $v0, $zero     # Colocar em $a0 o valor de retorno (em $v0) da função factorial pois...
                            # ... $a0 é o registrador de argumento para a fução "print" (cod. 1) do sistema operacional.

    li $v0, 1               # Colocar em $v0 o valor que indica qual função queremos que o sistema operacional...
                            # ... execute, que nesse caso é 1 pois queremos a função "print".
    syscall                 # Chamando o sistema operacional

    j end                   # Pula para o fim do programa

factorial:
    add $s3, $zero, $ra     # Colocar em $3 o endereço da função que chamou factorial

    add $s1, $zero, $v0     # Colocar em $s1 o valor de $v0
    add $s2, $zero, $v0     # Colocar em $s2 o valor de $v0

    jal factorialAux        # Salva em $ra o endereço da próxima linha e pula para função "factorialAux"
    add $v0, $zero, $v1

    jr $s3                  # Retorna para a linha da função que chamou factorial

factorialAux:
    addi $s2, $s2, -1          # $s2 = $s2-1
    mul $s1, $s1, $s2          # $s1 = $s1*$s2
    bgt $s2, 1, factorialAux   # if($s2 >= 0) factorial(); // Aqui ocorre uma recursão
    add $v1, $zero, $s1        # Coloca em $v1 o valor de $s1
    jr $ra                     # Retorna para a linha da função que chamou factorial

    # Obs.: como veremos a seguir, a maneira correta de se utilizar recursão em assembly é utilizando uma pilha,...
    # ... logo o presente programa ainda deve ser melhorado.

end:
    li $v0, 10
    syscall