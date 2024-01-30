vettore         dcd     10, 15, 18, 20, 25, 28, 30, 35
lenght_v        dcd     8
counts          fill    32

                mov     r0, #lenght_v
                ldr     r0, [r0]

                mov     r1, #vettore
                mov     r2, #counts

loop_v          
                cmp     r0, #0
                beq     end_loop_v

                sub     r0, r0, #1
                ldr     r3, [r1], #4

                mov     r10, #0
                mov     r4, #32
count_bit       
                cmp     r4, #0
                beq     end_count_bit

                sub     r4, r4, #1

                and     r5, r3, #1
                cmp     r5, #1
                bne     shift

                add     r10, r10, #1
shift           
                lsr     r3, r3, #1
                b       count_bit
end_count_bit   
                str     r10, [r2], #4
                b       loop_v
end_loop_v      
                mov     r2, #counts
                mov     r0, #lenght_v
                ldr     r0, [r0]

                ldr     r10, [r2] ;max
loop_counts     
                cmp     r0, #0
                beq     end_loop_counts

                sub     r0, r0, #1
                add     r2, r2, #4

                ldr     r9, [r2]

                cmp     r9, r10
                blt     next

                mov     r10, r9 ;r2 è max
next            
                b       loop_counts
end_loop_counts 
                end