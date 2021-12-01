# setup.s
.text
start:
.globl start
call main
finish:
mv a1, a0 # a1 = a0
li a0, 17  
ecall 
# Тестовая программа
#main.s
.text
main:
.globl main
 addi sp, sp, -16 # выделение памяти в стеке
 sw ra, 12(sp) # сохраняем ra
 la a0, array # 0 - adress for array
 lw a1, array_length # the length of arr
 call function
 li a0, 0 
 lw ra, 12(sp) 
 addi sp, sp, 16 
 ret #  return 0;
.rodata
array_length:
 .word 5
.data
array:
 .word 1,1,2,3,4
 
 # Подпрограмма
 #function.s
 .text
 function:
 .globl function
 #now in a0 –0 - adress for array a3 - a0
 # in a1 – the length of arr a2 - a1
 li a4, 0#a4 time max 
 li a5, 0#a5 type max
 li a6, 0# for (int i = 0 ......)
  loop1:
  bgeu a6, a1, loop1_exit #(if i >= length exit)
  slli t1, a6, 2
  add t1, t1, a0#t1 i-th element of array, type now
  li a7, 0#a7 for (int y = 0 ......)
  addi a6, a6 , 1# i++
  li t3, 0#t3 time now
    loop2:
    bgeu a6, a1, loop2_exit #(if y >= length exit)
    slli t2, a7, 2
    add t2, t2, a0#t2 y-th element of array, type now
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
 ret