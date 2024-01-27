         ;calcolodel prodotto scalare di due vettori
         ;r1     = puntatore array_a
         ;r2     = dimensione
         ;r3     = puntatore array_b
         ;r4     = valore array_a[r2]
         ;r5     = valore array_b[r2]
         ;r6     = loop mult
         ;r7     = r4 * r5
         ;r8     = r8 + r7 --> prodotto scalare


dim      dcd     4
array_a  dcd     10, 20, 30, 40
array_b  dcd     8, 4, 3, 2

         mov     r0, #dim
         ldr     r2, [r0]
         mov     r0, #0

         mov     r1, #array_a
         mov     r3, #array_b

loop     
         cmp     r2, #0
         beq     end_loop

         ldr     r4, [r1]
         ldr     r5, [r3]
         mov     r6, r5

         bl      multiply

multiply 
         cmp     r6, #0
         beq     sum
         add     r7, r7, r4
         sub     r6, r6, #1
         b       multiply
sum      
         add     r8, r8, r7
         mov     r7, #0
         add     r1, r1, #4
         add     r3, r3, #4
         sub     r2, r2, #1
         b       loop
end_loop 
         end























