               ;
               ;       media degli elementi divisibili per 3
               ;
dati           dcd     3,4,5,3,7,3,3

               mov     r0,#7
               mov     r1,#dati
               mov     r2,#0 ; somma parziale
               mov     r4,#0 ; numero di elementi considerati

loop           
               cmp     r0,#0
               beq     fine_loop
               ldr     r3,[r1] ; elemento i-esimo

               stmdb   r13!, {r0-r2} ; push r0,r1,r2 ; salvo i registri

               mov     r1,r3
               mov     r2,#3
               ;       r1 = elemento da dividere
               ;       r2 = 3
               bl      divisione
               ;       r0 = quoziente
               ;       r1 = resto
               cmp     r1,#0 ; se resto zero, il numero e' divisibile per 3
               beq     divisibile

               ldmia   r13!,{r0-r2} ; pop r2,r1,r0 ; recupero i registri
               b       non_divisibile


divisibile     
               ldmia   r13!,{r0-r2} ; pop r2,r1,r0 ; recupero i registri

               add     r4,r4,#1 ; aggiorno il numero di elementi considerati

               add     r2,r2,r3 ; aggiornamento somma parziale
non_divisibile 
               add     r1,r1,#4 ; incremento puntatore
               sub     r0,r0,#1 ; decremento contatore elementi
               b       loop

fine_loop      
               ;       r2 = somma elementi
               ;       r0 = 0

               mov     r1,r2
               mov     r2,r4
               bl      divisione
               ;       r0 = media
               end

               ;
               ;       input
               ;       r1 = dividendo
               ;       r2 = divisore
               ;       output
               ;       r0 = quoziente
               ;       r1 = resto
               ;
divisione      
               mov     r0,#0

div_loop       
               cmp     r1,r2
               blt     div_end
               sub     r1,r1,r2
               add     r0,r0,#1
               b       div_loop

div_end        
               mov     PC,LR