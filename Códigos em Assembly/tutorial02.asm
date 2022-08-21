    .data       # (1) Após o ".data" vêm a declaração de dados:

vector:         # (1.1) declaração de um "item" que representa um endereço de memória em que serão escritos... 
                # ... dados em sequência (pela ordem de declaração):

    .word 3     # v[0] = 3 (1º dado escrito)...
    .word 7     # v[1] = 7
    .word 5     # v[2] = 5
    .word 1     # v[3] = 1

    .text       # (2) Após o ".text" vêm as instruções:

    .globl main # declarando e definindo a função main com uma função global

main:                   # (3) Corpo da função main: 

    la $t0, vector      # "load address" - carrega um endereço em $t0 indicado que este é o endereço de um item do tipo vector
    lw $t1, 12($t0)     # $t1 = v[1] // "load word" - escreve em $t1 o conteúdo que está no endereço $t0 + deslocamento em bytes 
    addi $t1, $t1, 87   # $t1 = $t1 + 87 // "add immediate" - coloca o resultado da soma do conteúdo de $t1 somado à 87 em $t1
    sw $t1, 8($t0)      # v[2] = $t1 // "store word"

end:                    # (4) Corpo da função end (qual sempre irá encerrar o programa e seu label pode ser usa para isso):

    li $v0, 10          # $v0 = 10 // "load immediate" - escreve em $v0 o valor 10
    syscall             # chama o sistema operacional que irá verificar o registrador $v0 para executar alguma instrução e...
                        # ... caso a instrução receba argumentos irá olhar os registradores $a0, $a1, $a2, e/ou $f12 conforme...
                        # ... a instrução solicitada ao sistema operacional.