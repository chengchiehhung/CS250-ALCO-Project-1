# CS250-ALCO-Project-1
[Reference](https://hackmd.io/@wycchen/1102ALCO_project1)

## Formula
![](https://github.com/chengchiehhung/CS250-ALCO-Project-1/blob/master/formula.png)

## Goal
Use RISC-V assembly language to implement the Formula.

## Implementation Steps
1. Try to write out the C++ version first, please see the file "project1.cpp".
2. Explain the "1051336_proj_1.asm" as follows.
### Step1
預先將會用到的字串存在.data
(1) endl: "\nend" (2) Input0: "Input a number\n" (3) Outputl: "damage:\n"
### Step2
main 內容主要是用來讀取 user 輸入的數字
(1) 利用 systemcall number 4 來印出提示字串 (2) 利用 ststemcall number 5 來讀取 user 輸入的整數存入 a0 暫存器，作為 F(x) 的參數 (3) 再利用 jal function 跳至 function label 執行內容 (4) j exit 跳至 exit label 將最終結果印出，並結束程式。
### Step3
function 內容主要做 F(x) 的內容 (如圖 "formula.png")
(1) addi sp, sp, -12 生成 stack 可儲存 3 個變數
(2) 將 ra 暫存器中 main 的 return address 紀錄至 stack 中
(3) 將 a0 中的數字存錄 stack 中
(4) 將 a0 放入 t1 暫存器，將 const. 1 放入 t2 暫存器，以利後續使用
(5) bne t1, t2, elif2 判斷 user input 是否等於 1，若相等就跳至 funcend，若不相等就跳至 elif2
(6) bne t1, t0, elif3 判斷 user input 是否等於 0，若相等就跳至 funcend，若不相等就跳至 elif3
(7) addi t2, x0, 20; slt t5, t2, t1; eq t5, x0, elif4 判斷 user input 是否小於 20，若小於就跳至 elif4，若大於就執行 2*x +f(x/5)
(8) 以下程式碼以上述邏輯類推，完成 F(x) recursive function 內容
### Step4
funcend 內容是將 return address 從 stack 中 load 回來，並釋放 stack 空間，最後利用 jalr ra 跳回原本位址
### Step5
exit 內容是將最終結果 a1 放入 a0 後印出，並結束程式。

## Run it, and test the results as follows.
![](https://github.com/chengchiehhung/CS250-ALCO-Project-1/blob/master/outcome.png)