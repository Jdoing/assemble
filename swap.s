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

		movl $a, %eax
		movl %eax, 4(%esp)

		movl $b, %eax
		movl %eax, (%esp)
				
		call swap
		
        pushl a
        pushl $format
        call printf
        
        pushl b
        pushl $format
        call printf
        
        movl $0, (%esp)
        call exit
			
swap:
		pushl %ebp
		movl %esp, %ebp
		pushl %ebx
		
		movl 8(%ebp), %edx	#get xp
		movl 12(%ebp), %ecx	#get yp
		
		movl (%edx), %ebx	#get x
		movl (%ecx), %eax	#get y
		
		movl %eax, (%edx)
		movl %ebx, (%ecx)
		
		popl %ebx
		popl %ebp
		
		ret
		
		
		
		
		
		
		
