.globl main
.data
	endl: 		.string	"\nend"
	Input0: 	.string	"Input a number\n"	
	Outputl:	.string	"damage:\n"

.text
main:
	# the way to call systemcall
	# li a7, num -> check the num is printf or scanf
	# and then call ecall 
	la a0, Input0
	li a7, 4
	ecall		# printf( input a number )
	li a7 5		# a0 = scanf()
	ecall
	add t1,a0,zero	# t1 = input
	
	jal function
	j exit
function: # I set the a0 to pass parameter and a1 is to return value
	addi sp, sp, -12 # save ra and a1
	sw ra, 0(sp)
	sw sp, 4(sp)
	sw a0, 8(sp)
	
	add t1, x0, a0 # t1 = a0
	
	addi t2, x0, 1	# t2 = 1
if1:	bne t1, t2, elif2 # if ( t1 != t2 ) --> elif
	addi a1, x0, 5 #return 5
	j funcend
elif2:	bne t1, t0, elif3 # if ( t1 != 0 ) --> elif3
	addi a1, x0, 1 # return 1
	j funcend
elif3:	addi t2, x0, 20	 # if ( t1 < = 20 ) --> else
	slt t5, t2, t1    
	beq t5, x0, elif4
	
	addi t5, x0, 5
	div a0,t1, t5 # x/5
	jal function
	lw t1, 8(sp) # load original x
	
	slli t1, t1, 1 # x*2
	add a1, a1, t1
	
	# 2*x +f(x/5)
	j funcend
elif4:	addi t2, x0, 10	 # if ( t1 < = 10 ) --> elif5
	slt t5, t2, t1    
	beq t5, x0, elif5
	
	addi a0, t1, -2 # (x-2)
	jal function
	lw t1, 8(sp) # load original x
	sw a1, 8(sp) # save f(x-1) to stack
	
	addi a0, t1, -3 # (x-2)
	jal function
	lw t1, 8(sp)
	add a1, a1, t1
	
	#(x-2) + (x-3)
	j funcend
elif5:	addi t2, x0, 1	 # if ( t1 < = 1 ) --> else
	slt t5, t2, t1    
	beq t5, x0, else
	
	addi a0, t1, -1 # (x-1)
	jal function
	lw t1, 8(sp) # load original x
	sw a1, 8(sp) # save f(x-1) to stack
	
	addi a0, t1, -2 # (x-2)
	jal function
	lw t1, 8(sp)
	add a1, a1, t1
	
	# (x-1) + (x-2)
	j funcend
else:
	addi a1, x0, -1 #return 5
	j funcend
funcend:
	lw ra, 0(sp)
	addi sp, sp, 12
	jalr ra # return and back to the address inside ra
exit:
	la a0, Outputl
	li a7, 4
	ecall
	
	mv a0, a1
	li a7, 1
	ecall
	
	la a0, endl
	li a7, 4
	ecall
