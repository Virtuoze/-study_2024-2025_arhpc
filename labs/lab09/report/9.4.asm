%include 'in_out.asm'
SECTION .data

prim: DB 'f(x) = 2x+15',0
otv DB 'Результат: ',0
SECTION .text
GLOBAL _start
_start:
pop ecx
pop edx
sub ecx,1
mov esi,0
mov eax,prim
call sprintLF
next:
cmp ecx,0
jz _end
pop eax
call atoi
add esi,eax
loop next
_end:
mov eax,otv
call sprint
mov eax,esi
call iprintLF
call quit
