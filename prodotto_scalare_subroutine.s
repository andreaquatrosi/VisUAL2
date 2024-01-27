             ;prodotto scalare con subroutine
             ;prod_scalare += a[i]*b[i]
array_a      dcd     1, 2, 3, 4
array_b      dcd     2, 4, 6, 8
lenght       dcd     4

             mov     r0, #lenght
             ldr     r1, [r0] ;r1 = dim
             mov     r0, #0

             mov     r2, #array_a ;r2 = array_a
             mov     r3, #array_b ;r3 = array_b

loop         
             cmp     r1, #0
             beq     end_loop

             stmdb   sp!, {r1, r2}  ;push dim, array_a
             ldr     r1, [r2] ;a = r2[r1]
             ldr     r2, [r3] ;b = r3[r1]
             mov     r0, #0   ;r0 = prod
             b       multiply
next         
             ldmia   sp!, {r1, r2}
             add     r2, r2, #4
             add     r3, r3, #4
             sub     r1, r1, #1
             b       loop
end_loop     
             end
multiply     
             cmp     r2, #0
             beq     end_multiply
             add     r0, r0, r1
             sub     r2, r2, #1
             b       multiply
end_multiply 
             add     r4, r4, r0 ;r4 = prod_scalare
             b       next