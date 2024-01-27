dim              dcd     5
vettore          dcd     16, 2, 4, 32, 3
sixteen          fill    20
                 ;r0     = dimensione vettore
                 ;r1     = vettore
                 ;r2     = contatore
                 ;r3     = elemento vettore[r2]
                 ;r4     = sixteen
                 ;r5     = dimensione sixteen
                 ;r6     = temp
                 ;r8     = min
                 ;r9     = max

                 mov     r0, #dim
                 ldr     r2, [r0]
                 mov     r0, #0
                 mov     r1, #vettore
                 mov     r4, #sixteen

loop_v           
                 cmp     r2, #0
                 beq     end_loop_v

                 sub     r2, r2, #1
                 ldr     r3, [r1]

div_loop         
                 cmp     r3, #16
                 blt     end_div_loop

                 sub     r3, r3, #16
                 bl      div_loop
end_div_loop     

                 cmp     r3, #0
                 bne     next

                 ldr     r3, [r1]
                 str     r3, [r4]
                 add     r4, r4, #4
                 add     r1, r1, #4
                 add     r5, r5, #1
                 bl      loop_v
next             
                 add     r1, r1, #4
                 bl      loop_v
end_loop_v       
                 cmp     r5, #0
                 ble     end_program

                 mov     r6, r5 ;reset sixteen
reset_sixteen    
                 cmp     r6, #0
                 beq     max_min

                 sub     r6, r6, #1
                 sub     r4, r4, #4
                 bl      reset_sixteen

max_min          
                 ldr     r8, [r4]
                 ldr     r9, [r4]
loop_sixteen     
                 cmp     r5, #0
                 beq     end_program

                 sub     r5, r5, #1
                 ldr     r6, [r4, #4]

                 cmp     r6, r8
                 blt     min

                 cmp     r6, r9
                 bhi     max
min              
                 cmp     r6, #0
                 beq     end_loop_sixteen

                 mov     r8, r6
                 add     r4, r4, #4
                 bl      loop_sixteen

max              
                 mov     r9, r6
                 add     r4, r4, #4
                 bl      loop_sixteen
end_loop_sixteen 
                 add     r10, r8, r9

media            
                 cmp     r10, #2
                 blt     end_program

                 sub     r10, r10, #2
                 add     r11, r11, #1
                 bl      media
end_program 