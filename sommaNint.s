         ;somma  di N numeri
Num      dcd     4
data     dcd     100, 200, 300, 400

         mov     r0, #Num
         ldr     r2, [r0] ;r2 = numero di elementi (contatore)
         mov     r1, #data ;r1 = puntatore elemento array

         mov     r0, #0 ;r0 = somma parziale
loop     
         ;       condizione
         cmp     r2, #0
         beq     end_loop

         ;       prelevo il dato e lo sommo
         ldr     r3, [r1]
         add     r0, r0, r3

         ;       cambio elemento e sottraggo il contatore
         add     r1, r1, #4
         sub     r2, r2, #1

         b       loop
end_loop 