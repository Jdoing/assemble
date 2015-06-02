.section .data
		a: .int 4
        format: .asciz "%d\n"
.section .text
.global _start
_start:
		pushl %ebp
		movl %esp, %ebp
		subl $8, %esp #allocate storage space
		
		movl a, %edx	#get a
		movl %edx, (%esp)	#save value of a on stack
		
		call refact
		
        pushl %eax
        pushl $format
        call printf
        movl $0, (%esp)
        call exit            		
		
refact:
		pushl %ebp
		movl %esp, %ebp
		pushl %ebx
		subl $4, %esp	#allocate storage space
		
		movl 8(%ebp), %ebx	#get n
		cmpl $1, %ebx	
		jle done	#test (n-1) >= 0
		
		leal -1(%ebx), %eax	#(n-1)
		movl %eax, (%esp)
		call refact
		imul %ebx, %eax
		
done:
		
		addl $4, %esp	#release space
		popl %ebx
		popl %ebp
		ret
		
		
