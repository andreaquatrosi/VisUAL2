        ;calcolo del massimo

        mov     r1, #10
        mov     r2, #10

        cmp     r1, r2
        bhi     r1_max
        mov     r0, r2
        b       end_max

r1_max  
        mov     r0, r1
end_max 
        end

















