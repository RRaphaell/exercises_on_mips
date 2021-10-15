.data
userWord: .space 21
yes: .asciiz "YES"
no: .asciiz "NO"
lastChar: .asciiz "\n"
.text
main:
	# read user input String and put it in inuserWord
	li $v0, 8
	la $a0, userWord
	li $a1, 21
	syscall

	la $t1, userWord
	li $t2, 0x10010060
	
	li $t9, 0x0000000a
	addi $t3, $zero, 0
	addi $t4, $t4, 20
	li $t4, 0x10010060
	sb  $t9, 0($t4)
	sub $t4, $t4, 1
	la $t8, userWord
	addi $t5, $zero, 0
	# reverse userWord and put it in userWordReverse
	while:
		beq $t3, 20, checkPalindrome
		lbu  $a0, 0($t1)
		beq $a0, $t9 checkPalindrome 
		sb  $a0, 0($t4)	
		addi $t3, $t3, 1
		addi $t1, $t1, 1
		sub $t4, $t4, 1
		j while

	# check if userWord and userWordReverse is equal
	checkPalindrome:	 	
		beq $t5, 20, printYes
		lbu  $t6, 1($t4)
		lbu  $t7, 0($t8)
		bne $t6, $t7 printNo
		addi $t8, $t8, 1
		addi $t4, $t4, 1 
		addi $t5, $t5, 1
		j checkPalindrome

	printYes:
		la $a0, yes
		li $v0, 4
		syscall
		j exit
	printNo:
		la $a0, no
		li $v0, 4
		syscall
		j exit
		
	#finish program
	exit:
		li $v0, 10
		syscall
