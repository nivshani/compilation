.data

VFtableExample: .word Label_8_GrandfatherWalk,Label_24_SonRun,Label_16_FatherSwim

.text
main:

jal Label_0_main

Label_3_PrintInt_And_Exit:

	lw $a0,0($sp)
	li $v0,1
	syscall
	li $a0,32
	li $v0,11
	syscall
	li $v0,10
	syscall

Label_0_main:

	addi $fp,$sp,40

	la $t1,VFtableExample
	li $t2,2 # change this to either 0,1,2 to access vftable
	li $t3,4
	mul $t4,$t2,$t3 
	add $t5,$t1,$t4
	lw $t6,0($t5)
	jr $t6

Label_8_GrandfatherWalk:

	li $t0,700
	addi $sp,$sp,-4
	sw $t0,0($sp)
	jal Label_3_PrintInt_And_Exit

Label_16_FatherSwim:

	li $t0,600
	addi $sp,$sp,-4
	sw $t0,0($sp)
	jal Label_3_PrintInt_And_Exit

Label_24_SonRun:

	li $t0,500
	addi $sp,$sp,-4
	sw $t0,0($sp)
	jal Label_3_PrintInt_And_Exit

