.section .data
		array: .int 3, 0, 5, 1, 4, 6, 2, 9, 8, 7
		len: .int 10
        format: .asciz "%d\n"
.section .text
.global _start
_start:
		pushl %ebp
		movl %esp, %ebp
		subl $20, %esp	#allocate space
		
		movl $array, %edx
		movl %edx, (%esp)	#store &array on the stack
		
		movl len, %ecx
		movl %ecx, 4(%esp)	#store len on the stack
		
		call parray
        
        addl $20, %esp
        popl %ebp

        movl $0, (%esp)	#deallocate space
        call exit
parray:
		pushl %ebp
		movl %esp, %ebp
		push %ebx		
		subl $20, %esp	#allocate space
		
		movl 8(%ebp), %edx	#get &array
		movl 12(%ebp), %ebx	#get len
		
		movl $0, %ecx
		cmp %ecx, %ebx
		jle .done
.loop:
		movl (%edx, %ecx, 4), %eax
		
		call print
		
		inc %ecx
		cmp %ecx, %ebx
		jg .loop		
.done:
		addl $20, %esp
		popl %ebx
		popl %ebp
		ret
		
print:
		pushl %edx
		pushl %ecx
		
		pushl %eax
        pushl $format
        call printf
		
		addl $8, %esp
		popl %ecx
		popl %edx
		
		ret
		
