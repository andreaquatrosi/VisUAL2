           ;conteggio del numero di occorrenze di un elemento in un array

Num        dcd     10
array      dcd     1, 10, 5, 1, 15, 1, 20, 35, 10, 1

           mov     r0, #Num
           ldr     r2, [r0] ;r2 = contatore
           mov     r1, #array ;r1 = puntatore all'array

           mov     r0, #10 ;r0 = numero da cercare
           mov     r4, #0 ;r4 = numero di occorrenze
loop_a     
           cmp     r2, #0
           beq     end_loop_a

           ldr     r3, [r1]
           cmp     r3, r0
           bne     skip

           add     r4, r4, #1
           add     r1, r1, #4
           sub     r2, r2, #1
           b       loop_a

skip       
           add     r1, r1, #4
           sub     r2, r2, #1
           b       loop_a
end_loop_a 
           end





















