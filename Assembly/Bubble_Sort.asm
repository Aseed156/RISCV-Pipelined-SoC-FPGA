#Take an Array of 10 integers from User and Perform Bubble Sort
.data 
  msgStart: .asciz "=========Bubble Sort Program==============\n"
  msgEnterArray: .asciz "Enter an Array of 10 Integers\n"
  msgInput: .asciz "Enter Number\n"
  msgOutputArray: .asciz "You Entered: \n"
  msgSort: .asciz "Sorted Array: \n"
  array: .space 40
  newline: .asciz "\n"
  
.text

main:
#Display "Bubble Sort Program"
 lui a0, %hi(msgStart)
 addi a0,a0,%lo(msgStart)
 addi a7, x0, 4    #For Outputting String
 ecall
 
#Display "Enter an Array of 10 Integers"
 lui a0, %hi(msgEnterArray)
 addi a0,a0,%lo(msgEnterArray)
 addi a7, x0, 4    #For Outputting String
 ecall 
 
#=================Entering Values in Array================
InitIn:
 addi t1, x0, 10   #Counter
 #Loading Array Base Address  
 lui t2, %hi(array)
 addi t2, t2, %lo(array)

InputLoop:
#Enter An Integer of Array in a given Index
 lui a0, %hi(msgInput)
 addi a0, a0, %lo(msgInput) 
 addi a7,x0, 4
 ecall
#User Enters Value in a0,->Store it in Array's current Index
 addi a7,x0,5
 ecall
 sw a0,0(t2)
 
#Increment Index
 addi t2, t2, 4

#Decrement Counter
 addi t1, t1, -1
#Check for condition to Loop
 bne t1, x0, InputLoop
 

#=================== Output Values From Array===============

#Display "You Entered"
 lui a0, %hi(msgOutputArray)
 addi a0,a0,%lo(msgOutputArray)
 addi a7, x0, 4    #For Outputting String
 ecall 

InitOutput:
 addi t1, x0, 10   #Counter
 #Loading Array Base Address  
 lui t2, %hi(array)
 addi t2, t2, %lo(array)

OutputLoop:

#Displaying Value of Current Array Index
 lw   a0, 0(t2)
 addi a7,x0,1
 ecall
 
 
#Increment Index
 addi t2, t2, 4

#Decrement Counter
 addi t1, t1, -1
#Check for condition to Loop
 bne t1, x0, OutputLoop
 
 
#====================Bubble Sort================
Bubble_Sort:
#Initialize Outer Loop
 addi t3,x0,0   #i=0
 
Outer_Loop:
 addi t4 ,x0,0 #j
 addi t5, t4,4 #j+1
 addi s4, x0,0  #Counter for Inner Loop
 addi s3, x0,9  #n-1
 sub  s2, s3, t3  #n-1-i  
 slli s2, s2, 2
    
 Inner_Loop:
    lui t2, %hi(array)
    addi t2, t2, %lo(array)
    add a2, t2,t4        #base address of array[j]
    add a3, t2,t5        #base address of array[j+1]
    
    lw  a4, 0(a2)         #a4=array[j]
    lw  a5, 0(a3)         #a5=array[j+1]
    slt a6, a5,a4         #if array[j+1]<array[j] then a6=1
    beq a6,x0, Next_Iteration       #If a6=0(Sorted then skip the swap part)
    
    #Swap  array[j]<-->array[j+1]
    sw  a4, 0(a3)
    sw  a5, 0(a2)
  Next_Iteration:  
    addi t4, t4, 4 #j++
    addi t5, t4, 4 #j+1++
    bne  t4, s2, Inner_Loop
  addi t3,t3,1
  addi s3, x0, 9
  bne  t3,s3, Outer_Loop
  
#====================Display Final Answer=============== 

#New Line
 lui a0, %hi(newline)
 addi a0,a0,%lo(newline)
 addi a7, x0, 4    #For Outputting String
 ecall 
#Display "Enter an Array of 10 Integers"
 lui a0, %hi(msgSort)
 addi a0,a0,%lo(msgSort)
 addi a7, x0, 4    #For Outputting String
 ecall    
 
#=================== Output Values From Array===============

InitSortedOutput:
 addi t1, x0, 10   #Counter
 #Loading Array Base Address  
 lui t2, %hi(array)
 addi t2, t2, %lo(array)

SortedOutputLoop:

#Displaying Value of Current Array Index
 lw   a0, 0(t2)
 addi a7,x0,1
 ecall
 
 
#Increment Index
 addi t2, t2, 4

#Decrement Counter
 addi t1, t1, -1
#Check for condition to Loop
 bne t1, x0, SortedOutputLoop
