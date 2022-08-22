.data
    newLine:  .asciiz "\n\0"

.text
.globl main

main: 
    addi $s0, $zero, 10
    move $a0, $s0		    # $t0 = $s01 (move conteúdo de um registrador para outro)
    li, $v0, 1
    syscall

increaseRegister:


end: 
    li, $v0, 10
    syscall