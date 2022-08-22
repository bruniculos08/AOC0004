.data
.text
.globl main

main:
    li, $v0, 5
    syscall
    li $a0, 1

while:
    mul $a0, $a0, $v0
    addi $v0, $v0, -1
    bgtz $v0, while
    li $v0, 1
    syscall

end:
    li $v0, 10
    syscall