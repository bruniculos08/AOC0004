.text
.globl main

main: # cada função é um rótulo para o qual o código pode ser desviado (como de costume deve haver uma função main porém no MARS não é necessário...
      # ... pois ele executára a primeira instrução).
    li $t0, 011 # número decimal 9 em octal (começa com '0')
    li $t1, 22 # número decimal 22
