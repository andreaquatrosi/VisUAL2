         ;divisione intera
         ;r1     / r2 = r1 - r2
         ;30     / 5 = 6
         mov     r1, #30
         mov     r2, #5
         mov     r0, #0

loop     
         ;condizione
         cmp     r1, r2
         blt     end_loop
         ;divisione
         sub     r1, r1, r2
         add     r0, r0, #1
         b       loop
end_loop 