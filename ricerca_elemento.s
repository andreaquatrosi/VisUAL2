            ;ricerca di un elemento in un array
Num         dcd     5
array       dcd     10, 20, 5, 15

            mov     r0, #Num
            ldr     r2, [r0] ;r2 = contatore
            mov     r1, #array

            mov     r0, #30 ;r0 = numero da ricercare

loop_a      
            cmp     r2, #0
            beq     end_loop_a

            ;       confronto valore in array[r2]
            ldr     r3, [r1]
            cmp     r3, r0
            bne     not_found

            ;       salvo il valore e finisco la ricerca
            ldr     r4, [r1]
            add     r1, r1, #4
            sub     r2, r2, #1
            b       end_ricerca
not_found   ;passo  al prossimo elemento
            add     r1, r1, #4
            sub     r2, r2, #1
            b       loop_a
end_loop_a  
end_ricerca 
            end












