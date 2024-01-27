        ;calcolodel minimo

        mov     r1, #1
        mov     r2, #2

        cmp     r1, r2
        blt     r1_min
        mov     r0, r2
        b       end_min

r1_min  
        mov     r0, r1
end_min 
        end






