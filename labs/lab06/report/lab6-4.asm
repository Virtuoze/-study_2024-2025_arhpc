%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80 ; Переменная, значение которой будем вводить вручную 
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразование
call atoi ; ASCII кода в число, 'eax=x'
add eax,18; eax+18 = x+18
mov ebx,5
mul ebx; EAX=EAX*EBX = 5*(x+18)
add eax,-28; eax = eax-28 = 5*(x+18)-28
mov edi,eax ; запись результата выполнения в 'edi'
; ---- Вывод результата на экран
mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprint ; из 'edi' в виде символов
call quit ; вызов подпрограммы завершения
