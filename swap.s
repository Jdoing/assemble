.section .data
		a: .int 534
		b: .int 1057
        format: .asciz "%d\n"
.section .text
.global _start
_start:
		pushl %ebp
		movl %esp, %ebp
		subl $24, %esp
		
		movl a, %edx
		movl b, %ecx
		
		movl %edx, -4(%ebp)
		movl %ecx, -8(%ebp)
		
		leal -8(%ebp), %eax
		movl %eax, 4(%esp)
		
		leal -4(%ebp), %eax
		movl %eax, (%esp)
				
		call swap_add
		
		movl -4(%ebp), %edx
		subl -8(%ebp), %edx
		
		imul %edx, %eax
		
		#movl %eax, %edx
		#leave
		#ret
		
        pushl %eax
        pushl $format
        call printf
        movl $0, (%esp)
        call exit
			
swap_add:
		pushl %ebp
		movl %esp, %ebp
		pushl %ebx
		
		movl 8(%ebp), %edx	#get xp
		movl 12(%ebp), %ecx	#get yp
		
		movl (%edx), %ebx	#get x
		movl (%ecx), %eax	#get y
		
		movl %eax, (%edx)
		movl %ebx, (%ecx)
		
		addl %ebx, %eax
		
		popl %ebx
		popl %ebp
		
		ret
		
		
		
		
		
		
		
