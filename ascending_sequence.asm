#yvela ricxvi Enterit shegvyavs
.data
	space: .asciiz " "
   	enter: .asciiz "\n"
	array1: .space 400
	array2: .space 40
.text
main:
	li $v0, 5
	syscall
	move $t0, $v0 
	move $t2, $t0
	while:
		beq $t2, 0, whileBreak
		li $v0, 5
	    	syscall
		sw $v0, array1($t1)
		addi $t1, $t1, 4
		sub $t2, $t2, 1
		jal while
	whileBreak:
		addi $t1, $zero, 1
		sw $t1, array2($zero)
		move $t2, $t1 
		move $t3, $t1 
		move $t8, $zero 
	for1:
		beq $t2, $t0, exit	
		mul $t3, $t2, 4
		sw $t1, array2($t3)
		sub $t4, $t2, 1
	for2:
		beq $t4, -1, for2Break
		mul $t5, $t4, 4 
		lw $t6, array1($t3) 
		lw $t7, array1($t5) 
		bgt $t6, $t7, findMax
	for2Break:		
		lw $t6, array2($t3)
		bgt $t6, $t8, swap
		add $t2, $t2, 1
		jal for1
	swap:
		move $t8, $t6
		add $t2, $t2, 1
		jal for1
	exit:
		li $v0, 1
		move $a0, $t8
		syscall
		li $v0, 10
		syscall		
	findMax:				
		lw $t6, array2($t3)					
 		lw $t7, array2($t5)						
		add $t7, $t7, 1	
		bgt $t7, $t6, change
		sub $t4, $t4, 1
		jal for2
	change:
		sw $t7, array2($t3)												
		sub $t4, $t4, 1
		jal for2						
									
										
											
												
													
															
