# CS250-ALCO-Project-1
[Reference]("https://hackmd.io/@wycchen/1102ALCO_project1")

## Formula
$$F(x) =
\begin{cases} 
2 \cdot x + F(\frac{x}{5}),\quad x > 20\\
F(x-2) + F(x-3),\quad  10 < x \leq 20\\
F(x-1) + F(x-2),\quad  1 < x \leq 10\\
1,\quad  x = 0\\
5,\quad  x = 1\\
-1,\quad otherwise
\end{cases}$$

## Goal
Use RISC-V assembly language to implement the Formula.