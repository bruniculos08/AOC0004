main:
    MOVLW 4; w = 4
    MOVWF 0x00; MEM[0x00] = w

    MOVLW 7; w = 7
    MOVWF 0x04; MEM[0x04] = w

    while:
        ;z = x + y
        MOVF 0x04, 0; w = MEM[0x04]
        ADDWF 0x00, 0; w = w + MEM[0x00]
        MOVWF 0x0c; MEM[0x0c] = w

        MOVF 0x04, 0; w = MEM[0x04]

        ;q = x & y
        ANDWF 0x00, 0 ; w = x & y
        MOVWF 0x10; MEM[0x10] = w

        ;z - q == 0
        MOVF 0x10, 0; w = MEM[0x10] = q
        SUBWF 0x0c, 1; 0x0c - w = z - q

        INCF 0x0c, 1 
        DECFSZ 0x0c, 1
        GOTO continue
        GOTO end

continue:
        ADDWF 0x0c, 1; z = z + q
        DECF 0x00, 1
        GOTO while

end:
        ADDWF 0x0c, 1; z = z + q
        END