.section .data
		n: .int 3
        format: .asciz "%d\n"
.section .text
.global _start
_start:
		pushl %ebp
		movl %esp, %ebp
		subl $8, %esp
		
		movl n, %ecx		
		movl %ecx, (%esp)
		call fact_for

		pushl %eax
        pushl $format
        call printf
        
        movl $0, (%esp)
        call exit
        
fact_for:
		pushl %ebp
		movl %esp, %ebp
		pushl %ebx
		
		movl 8(%ebp), %edx	#get n
		movl $1, %eax		#init result
		movl $2, %ecx		#init i
		
		cmp %ecx, %edx
		jl .done
		
.loop:
		imul %ecx, %eax
		inc %ecx
		cmp %ecx, %edx
		jge .loop

.done:
		popl %ebx
		popl %ebp
		
		ret		
