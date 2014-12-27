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
		call fact_do
		
		
		pushl %eax
        pushl $format
        call printf
        movl $0, (%esp)
        call exit
		
fact_do:
		pushl %ebp
		movl %esp, %ebp
		pushl %ebx
		
		movl 8(%ebp), %edx	#get n
		movl $1, %eax		#init result
.loop:
		imul %edx, %eax
		dec %edx
		cmp $1, %edx
		jg .loop
		
		popl %ebx
		popl %ebp
		
		ret
	
		
