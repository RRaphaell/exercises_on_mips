.data
space: .asciiz " "
enter: .asciiz "\n"
input0: .asciiz "Enter number by Entering"
input1: .asciiz "Enter first number: "
input2: .asciiz "Enter second number: "
.text
main:
	li $v0, 4
	la $a0, input0
	syscall
	la $a0, enter
	syscall
	la $a0, input1
	syscall
	li $v0, 5
	syscall
	move $t1,$v0
	li $v0, 4
	la $a0, input2
	syscall
	li $v0, 5
	syscall
	move $t2,$v0
	sub $t1,$t1, 1
	add $t2, $t2, 1
	for:
		beq $t4, 1 count
		add $t1, $t1, 1
		beq $t1, $t2 exit
		j isPrime
		j for
	exit:
		li $v0, 4
		la $a0,enter
		syscall
		li $v0, 1
		move $a0, $t3
		syscall
		
		li $v0, 10
		syscall

isPrime:
	ble $t1, 1 for
	ble $t1, 3 putTrue
	rem $t5, $t1, 2
	rem $t6, $t1, 3
	beq $t5, 0 for
	beq $t6, 0 for
	li $t7, 5
	for2: 
	mul $k1, $t7, $t7
	bgt $k1, $t1 exit2
	rem $t8, $t1, $t7
	add $k0, $t7 2 
	rem $t9, $t1, $k0
	beq $t8, 0 for
	beq $t9, 0 for
	add $t7,$t7 6
	j for2
	exit2:
	add $t4, $zero,1

putTrue: 
	add $t4, $zero,1
	j for
	
count:
	add $t3, $t3, 1
	li $t4, 0
	j for







	
