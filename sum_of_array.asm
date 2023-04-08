.data
arr : .space 20 # array of 20 bytes
output : .word 0 # variable for sum of array
a : .asciiz "enter 5 no. \n"
b : .asciiz "enter the no. : "


.text
main:

    li $v0, 4
    la $a0,a
    syscall

    li $v0,4
    la $a0,b
    syscall

    li $v0,5
    syscall
    move $s0,$v0


    li $v0,4
    la $a0,b
    syscall

    li $v0,5
    syscall
    move $s1,$v0



    li $v0,4
    la $a0,b
    syscall

    li $v0,5
    syscall
    move $s2,$v0


    li $v0,4
    la $a0,b
    syscall

    li $v0,5
    syscall
    move $s3,$v0


    li $v0,4
    la $a0,b
    syscall

    li $v0,5
    syscall
    move $s4,$v0

    #index t0 =0 
    addi $t0,$zer0,0

    #store
    sw $s0,arr($t0)
    addi $t0,$t0,4

    sw $s1,arr($t0)
    addi $t0,$t0,4

    sw $s2,arr($t0)
    addi $t0,$t0,4

    sw $s3,arr($t0)
    addi $t0,$t0,4

    sw $s4,arr($t0)

    jai print_sum_array #jump to the fn
    sw $v0,output # store sum of array

    li $v0,1 
    lw $a0,output
    syscall # print output

    li $v0,10
    syscall  # exit the program


print_sum_array:
# initializing index t0 to 0 and t1 to 20
    addi $t0,$zero,0
    addi $t1,$zero,20

    li $v0,0  # inialize sum =0

    loop:
        beq $t0, $t1, endloop
        lw $t2,arr($t2)
        add $v0,$v0,$t2
        addi $t0,$t0,4
        j loop


    endloop:
        jr $ra

