.data
arr:
 .word 1,4,13,12,16

.text
.globl _start

_start:
   lui t1, %hi(arr)
   addi t1,t1,%lo(arr)
   addi t6, zero, 5
    
loop:
   lw  t2,(t1)
   andi t2,t2,1
   beq t2,zero, Even
  return_from_even:
   bne  t2,zero, Odd
  return_from_odd: 
  addi t1,t1,4
  addi  t6,t6,-1
  bne t6,zero, loop
  jal End
   
   
   
   
Even:
   add t3,zero,zero
   addi t3,t1,20
   addi t4,zero,1
   sw   t4,(t3)
   jal  t5,return_from_even
   

Odd:
   add t3,zero,zero
   addi t3,t1,20
   addi t4,zero,2
   sw   t4,(t3)
   jal  t5,return_from_odd
   
   
End:
