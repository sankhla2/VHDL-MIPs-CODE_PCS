.data
a : .asciiz "enter the no. : "
b : .asciiz "enter the another no : "
c : .asciiz "enter the smallest no. among : "
.text 
main:
    li $v0,4  #print string
    la $a0,a
    syscall # print a

    li $v0,5 # read integer
    syscall  # read integer from user
    move $t0, $v0

    li $v0,4  #print string
    la $a0,b
    syscall # print b

    li $v0,5 # read integer
    syscall  # read integer from user
    move $t1, $v0


    jal compare

    li $v0, 4  # print string
    la $a0, c
    syscall # print result


    li $v1, 4 # print integer
    move $a0,$t3
    syscall

    li $v0,10 # exit program
    syscall # exit the program

compare : # compare fn slt ==set less than
    slt $t2,$t0,$$t1
    beq $t2,1 , winner2
    beq $t2,0,winner 1

winner1 :
    move $t3,$t1
    jr $ra # return to main fn

winner2 :
    move $t3,$t0
    jr $ra # return to main fn

