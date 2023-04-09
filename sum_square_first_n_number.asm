.data
prompt1: .asciiz "Enter a number: "
prompt2: .asciiz "Sum of squares of first n natural numbers: "
array: .word 0

.text
main:
   
    li $v0, 4
    la $a0, prompt1
    syscall

    
    li $v0, 5
    syscall
    
    # natural number n
    move $t0, $v0
    
    li $t1, 1
    li $t4, 0
    jal square_first_n_numbers
    
    li $v0, 4
    la $a0, prompt2
    syscall
    
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall

square_first_n_numbers:

    bgt $t1, $t0, end_func

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    mult $t1, $t1
    mflo $t3
    addi $t1, $t1, 1

    addi $sp, $sp, -4
    sw $t3, 0($sp)
  
    
    jal square_first_n_numbers

    lw $t3, 0($sp)
    addi $sp, $sp, 4
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    add $t4, $t4, $t3
    
    jr $ra


end_func:
    jr $ra
