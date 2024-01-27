lenght_a       dcd     8
array_a        dcd     2, 4, 5, 7, 8, 16, 9, 22
array_x        fill    32
array_y        fill    32
int_k          dcd     4
               ;r0     = 1 ==> array_x
               ;r0     = 2 ==> array_y
               ;r1     = lenght_a
               ;r2     = array_a
               ;r3     = array_x
               ;r4     = array_y
               ;r5     = elemento corrente
               ;r9     = temp_r1
               ;r10    = int_k
               ;r11    = dim_is_div
               ;r12    = dim_isnt_div

               mov     r0, #lenght_a
               ldr     r1, [r0]
               mov     r2, #array_a

               mov     r3, #array_x
               mov     r4, #array_y

               mov     r0, #0
               mov     r0, #int_k

loop_a         
               cmp     r1, #0
               beq     end_loop_a

               sub     r1, r1, #1
               stmdb   SP!, {r1, r2}
               ldr     r1, [r2]
               ldr     r2, [r0]

               mov     r9, r1

               b       divisibile
return         
               ldmia   SP!, {r1, r2}
               add     r2, r2, #4
               b       loop_a

end_loop_a     
               mov     r0, #0
               cmp     r11, r12
               blt     array_y_bigger

               mov     r0, #1
               end
array_y_bigger 
               mov     r0, #2
               end
               ;subroutine
divisibile     
               cmp     r1, r2
               blt     check_if_div

               sub     r1, r1, r2
               b       divisibile
check_if_div   
               cmp     r1, #0
               beq     is_div

               str     r9, [r4]
               add     r4, r4, #4
               add     r12, r12, #1
               b       return
is_div         
               str     r9, [r3]
               add     r3, r3, #4
               add     r11, r11, #1
               b       return