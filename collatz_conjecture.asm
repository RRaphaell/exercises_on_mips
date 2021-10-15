.data
Ltwo: .byte 0x02
Lthree: .byte 0x03
space: .asciiz " "
enter: .asciiz "\n"
input: .asciiz "Enter number: "
.text
main:
	add $t4, $t4, $zero
	li $v0, 4
	la $a0, input
	syscall
	li $v0, 5
	syscall
	move $t0,$v0
	while:
		beq $t0, 1 exit
		lb $t2, Ltwo
		div $t0, $t2
		mfhi $t6
		beq $t6, 0 even
		beq $t6, 1 odd
	
		j while
	exit:
		li $v0, 4
		la $a0,enter
		syscall
		li $v0, 1
		move $a0, $t4
		syscall
		li $v0, 10
		syscall

even:
	add $t4, $t4, 1
	div $t0, $t0, $t2
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	li $v0, 4
	la $a0, space
	syscall
	j while

odd: 
	add $t4, $t4, 1
	lb $t3, Lthree
	mul $t0, $t0,$t3
	addi $t0, $t0, 1
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	li $v0, 4
	la $a0, space
	syscall
	j while






	
