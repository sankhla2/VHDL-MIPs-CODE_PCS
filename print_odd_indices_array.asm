.data
prompt1: .asciiz "Enter the size of the array: "
prompt2: .asciiz "Enter a number: "
comma: .asciiz ", "
array: .word 0

.text
main:
   
    # printing the prompt
    li $v0, 4
    la $a0, prompt1
    syscall

    # reading the size of the array
    li $v0, 5
    syscall
    
    # storing the size of the array in $t0
    move $t0, $v0
    
    # counter for the loop
    move $t1, $zero

    # counter for inserting values in an array
    move $t2, $zero
    
loop_array_in:    
    # print prompt
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # read the number
    li $v0, 5
    syscall
    
    # store the number in the array
    sw $v0, array($t2)
    
    # increment the counters
    addi $t2, $t2, 4
    addi $t1, $t1, 1
    
    # check if the loop should continue
    blt $t1, $t0, loop_array_in

    # we have taken the inputs for the array

    # print the array
    li $t1, 1
    li $t2, 4
    jal print_odd_indices_recursively

exit:
    li $v0, 10
    syscall


print_odd_indices_recursively:

    # base condition
    bge $t1, $t0, end_func

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    lw $t3, array($t2)
    addi $t2, $t2, 8
    addi $t1, $t1, 2

    addi $sp, $sp, -4
    sw $t3, 0($sp)

    jal print_odd_indices_recursively

    
    lw $t3, 0($sp)
    addi $sp, $sp, 4
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 4
    la $a0, comma
    syscall
    
    jr $ra


end_func:
    jr $ra
