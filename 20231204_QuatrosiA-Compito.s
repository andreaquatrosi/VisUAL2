lenght_v     dcd     8
array_v      dcd     136, 128, 137, 8, 70, 2, 3, 5 ;1000 1000
array_x      fill    32

             ;r0     = lenght_v
             ;r1     = array_v
             ;r2     = array_x
             ;r3     = array_v[r0]
             ;r4     = risultato comparazione b3 = 8 e b7 = 128
             ;r5     = lenght_x
             ;r6     = min
             ;r7     = array_x[r10]
             ;r10    = r5

             mov     r0, #lenght_v
             ldr     r0, [r0]

             mov     r1, #array_v
             mov     r2, #array_x

loop_v       
             cmp     r0, #0
             beq     end_loop_v

             sub     r0, r0, #1
             ldr     r3, [r1], #4

             b       compare_loop
end_loop_v   
             mov     r10, r5
reset_r2     
             cmp     r5, #0
             beq     end_reset_r2

             sub     r2, r2, #4
             sub     r5, r5, #1
             b       reset_r2
end_reset_r2 
             ldr     r6, [r2] ;r6 = min
loop_x       
             cmp     r10, #0
             beq     end_loop_x

             sub     r10, r10, #1
             ldr     r7, [r2], #4

             cmp     r6, r7
             bhi     is_not_min

             b       loop_x
is_not_min   
             mov     r6, r7
             b       loop_x
end_loop_x   
             end
compare_loop 
             and     r4, r3, #8
             cmp     r4, #8
             bne     not_equal

             and     r4, r3, #128
             cmp     r4, #128
             bne     not_equal

             str     r3, [r2], #4
             add     r5, r5, #1
not_equal    
             b       loop_v