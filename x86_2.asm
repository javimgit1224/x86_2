extern printf	;write to standard output device
extern scanf	;read from standard input device
extern malloc
extern free
extern realloc
extern showquads

global array	;makes the functions callable from outside of this file 

segment .data	;initialize data

;create messages
initial db "welcome to the array program. this program will save your 64-bit data in an array",10,0
prompt db "please enter the floating point number and press enter after each number. the limit is 10 numbers",10,0
thanks db "thank you for your inputs. your array is as follows: ",10,0
swapping db "the software is now swapping the largest and smallest numbers in the array. finished",10 "your array is now the following. ",10,0
goodbye db "this assembly function will now return to the caller function.",10,0

string_format db "%s", 0	;general string format
float_format db "%lf",0		;general 8 byte format 

segment .bss	;declare pointer to not initialized space in this segment

;begin application
segment .text	;execute instructions

array:	;execution begins here

;start of assembly program
push rbp
mov rbp, rsp

;show initial message
mov qword rax, 0
mov rdi, string_format
mov rsi, initial
call printf wrt ..plt	;call print using pic technique 

;prompt for float point numbers
mov qword rax, 0
mov rdi, prompt
call printf wrt ..plt

;loop to receive inputted numbers unitl control+d
mov r15,0	;start counter at 0
begin_loop:

push qword 0
mov qword rax, 0
mov rdi, float_format
mov rsi, rsp
call scanf wrt ..plt
cdq
shl rdx, 32
or rax, rdx
cmp rax, -1
je loop_finished
movsd xmm0, [rsp]
pop rax
inc r15
jmp begin_loop

loop_finished:
pop rax

 
