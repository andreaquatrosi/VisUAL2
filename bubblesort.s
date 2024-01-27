                ;ordinamento di un array (bubblesort)

dim             dcd     5
array_a         dcd     2, 5, 4, 1, 3

                mov     r0, #dim
                ldr     r2, [r0]
                ldr     r6, [r0]
                mov     r8, #0
                mov     r3, r2
                ;mov    r0, #0

                mov     r1, #array_a

                sub     r7, r6, r8
                sub     r7, r7, #1
loop            
                cmp     r6, #1
                beq     end_loop

loop_bubblesort 
                cmp     r2, r7
                blt     next_loop

                ;bubblesort
                ldr     r3, [r1]
                ldr     r4, [r1, #4]

                cmp     r3, r4
                bhi     swap
                add     r9, r9, #1
                bl      next
swap            
                mov     r5, r3
                str     r4, [r1]
                str     r3, [r1, #4]
                mov     r5, #0
                bl      next
next            
                add     r1, r1, #4
                sub     r2, r2, #1
                bl      loop_bubblesort
next_loop       
                cmp     r9, #0
                beq     incremento

                sub     r1, r1, #4
                sub     r9, r9, #1
                add     r2, r2, #1
                ldr     r2, [r0]
                mov     r7, #0
                bl      next_loop
incremento      
                add     r8, r8, #1
                sub     r6, r6, #1
                sub     r7, r6, r8
                sub     r7, r7, #1
                bl      loop
end_loop        


















