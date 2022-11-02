#include <stdio.h>

int main(void){
    int mem[1000];
    int w = 10;
    mem[0x08] = 10;
    w = 0;
    while(1){
        mem[0x08]--;
        if(mem[0x08] == 0) break;
        else w = w + mem[0x08];
    }
    mem[0x08] = w;
}