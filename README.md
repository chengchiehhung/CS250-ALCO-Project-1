# CS250-ALCO-Project-1
[Reference](https://hackmd.io/@wycchen/1102ALCO_project1)

## Formula
![](https://github.com/chengchiehhung/CS250-ALCO-Project-1/blob/master/formula.png)

## Goal
Use RISC-V assembly language to implement the Formula.

## Implementation Steps
1. Try to write out the C++ version first.
2. Break down the recursive structures, and they follow the simliar pattern as elif4, for example.
```assembly
elif4:	addi t2, x0, 10	 # if ( t1 < = 10 ), then jump to elif5.
	slt t5, t2, t1    # if t2 < t1, then assign 1 to t5.
	beq t5, x0, elif5 # if t5 = 0, then jump ot elif5.
	
	addi a0, t1, -2 # (x-2)
	jal function # f(x-2)
	lw t1, 8(sp) # load original x
	sw a1, 8(sp) # save f(x-2) to stack
	
	addi a0, t1, -3 # (x-3)
	jal function # f(x-3)
	lw t1, 8(sp) # load f(x-2) 
	add a1, a1, t1 # f(x-2) + f(x-3)

	#(x-2) + (x-3)
	j funcend
```
3. Run it, and test the results as follows.
![](https://github.com/chengchiehhung/CS250-ALCO-Project-1/blob/master/outcome.png)