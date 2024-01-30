lenght_a     dcd     8
array_a      dcd     3,10,9,7,5,2,0,4
lenght_b     dcd     8
array_b      dcd     10,20,3,5,2,33,54,100
found        fill    32

             ;r0     = temp dim
             ;r1     = ptr array_a
             ;r2     = dim array_a
             ;r3     = ptr array_b
             ;r4     = dim array_b
             ;r10    = ptr a found

             mov     r0, #lenght_b
             ldr     r4, [r0]
             mov     r3, #array_b

             mov     r0, #lenght_a
             ldr     r2, [r0]
             mov     r1, #array_a

             mov     r10, #found

loop_array_b 
             cmp     r4, #0
             beq     end_loop_b

             sub     r4, r4, #1
             ldr     r5, [r3]
             ;r5     = valore di b da confrontare con i valori di a
loop_array_a 
             cmp     r2, #0
             beq     end_loop_a

             sub     r2, r2, #1
             add     r7, r7, #1
             ;r7     = count cicli di a per il reset
             ldr     r6, [r1]
             add     r1, r1, #4

             cmp     r5, r6
             beq     found_in_a

             bl      loop_array_a
found_in_a   
             mov     r5, #1
             str     r5, [r10]
             add     r10, r10, #4

             ldr     r2, [r0]
             add     r3, r3, #4
reset_a      
             cmp     r7, #0
             beq     loop_array_b

             sub     r1, r1, #4
             sub     r7, r7, #1
             bl      reset_a
end_loop_a   
             add     r3, r3, #4
             mov     r5, #0
             str     r5, [r10]
             add     r10, r10, #4
             ldr     r2, [r0]
             bl      reset_a
end_loop_b   
             end