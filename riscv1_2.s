.text
 start:
 .globl start
 la a2, length_arr
 lw a2, 0(a3) #the length of arr
 la a3, array #0th adress for array
 li a4, 0#a4 time max 
 li a5, 0#a5 type max
 li a6, 0# for (int i = 0 ......)
  loop1:
  bgeu a6, a2, loop1_exit #(if i >= length exit)
  slli t1, a6, 2
  add t1, t1, a3#t1 i-th element of array, type now
  li a7, 0#a7 for (int y = 0 ......)
  addi a6, a6 , 1# i++
  li t3, 0#t3 time now
    loop2:
    bgeu a6, a2, loop2_exit #(if y >= length exit)
    slli t2, a7, 2
    add t2, t2, a3#t2 y-th element of array, type now
    addi t3, t3 , 1# y++
    bltu t2 , t1 , loop2
    bltu t1 , t2 , loop2# if t1 = t2
    addi t3, t3,1#time now + 1
    bgeu a4, t3, loop2 #if time max >= time now return loop2
    sw t3, 0(a4)
    sw t1, 0(a5)
    jal zero, loop2
    loop2_exit:
  jal zero, loop1
  loop1_exit:
  finish:
 li a0, 10 # x10 = 10
 li a1, 0 # x11 = 0
 ecall 
 .rodata
length_arr:
 .word 5
.data
array:
 .word 1,1,2,3,4