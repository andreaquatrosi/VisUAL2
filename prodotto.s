         ;moltiplicazione intera
         ;Prodotto = A * B = A + A + ... + A (B volte)
         ;R0     = R1 * R2 = R1 + R1 + ... + R1 (R2 volte)

         MOV     r1, #7
         mov     r2, #20
         mov     r0, #0 ;risultato
loop     
         ;       condizione
         cmp     r2, #0
         beq     end_loop
         ;       moltiplicazione
         add     r0, r0, r1
         sub     r2, r2, #1
         b       loop
end_loop 