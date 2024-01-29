array_v      dcd     136, 138, 128, 8, 139, 10, 20, 112
lenght_v     dcd     8
array_v1     fill    32

             mov     r0, #lenght_v
             ldr     r0, [r0]

             mov     r1, #array_v
             mov     r2, #array_v1
loop_v       
             cmp     r0, #0
             beq     end_loop_v

             sub     r0, r0, #1

             stmdb   SP!, {r0, r1}

             LDR     r1, [r1]

             b       compare
pop          
             ldmia   SP!, {r0, r1}
             add     r1, r1, #4
             b       loop_v
end_loop_v   
             mov     r10, r3
reset_r2     
             cmp     r3, #0
             beq     end_reset

             sub     r3, r3, #1
             sub     r2, r2, #4

             b       reset_r2
end_reset    
             ldr     r4, [r2]
loop_v1      
             cmp     r3, #0
             beq     end_exam

             sub     r3, r3, #1

             ldr     r5, [r10], #4

             cmp     r4, r5
             blt     next_element

             mov     r4, r5
next_element 
             b       loop_v1
end_exam     
             end
compare      
             and     r0, r1, #8
             cmp     r0, #8
             BNE     skip

             and     r0, r1, #128
             cmp     r0, #128
             bne     skip

             str     r1, [r2]
             add     r2, r2, #4
             add     r3, r3, #1
skip         
             b       pop