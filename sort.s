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
		
		movl $array, %eax
		movl %eax, (%esp)	#store &array on the stack
		
		movl len, %eax
		movl %eax, 4(%esp)	#store len on the stack
		
		call sort
		
		call parray
		
		movl $0, (%esp)	#deallocate space
        call exit
sort:					#3, 0, 5, 1, 4, 6, 2, 9, 8, 7
		pushl %ebp
		movl %esp, %ebp
		pushl %ebx
		subl $20, %esp
		
		movl 8(%ebp), %edx	#get &array
		movl 12(%ebp), %ebx	#get len
		
		movl $0, %ecx	#init i=0
		cmp %ecx, %ebx
		jle .done

		leal 1(%ecx), %eax #init j=i+1

		cmp %eax, %ebx
		jle .L1
		
.L2:
		movl (%edx, %ecx, 4), %esi	#get a[i]
		movl (%edx, %eax, 4), %edi	#get a[j]
		
		cmp %edi, %esi
		
		jl .C1
		
		leal (%edx, %ecx, 4), %esi
		movl %esi, (%esp)
		leal (%edx, %eax, 4), %esi
		movl %esi, 4(%esp)		
		
		call swap
		inc %eax
		cmp %eax, %ebx
		jle .L1		
		jmp .L2
		
.C1:
		inc %eax
		cmp %eax, %ebx
		jle .L1
		
		jmp .L2

.L1: 
		inc %ecx
		cmp %ecx, %ebx
		jle .done
		
		leal 1(%ecx), %eax #init j=i+1
		cmp %eax, %ebx
		jle .L1
		jmp .L2

swap:
		pushl %ebp
		movl %esp, %ebp
		pushl %eax
		pushl %ebx
		pushl %ecx
		pushl %edx
		
		movl 8(%ebp), %edx	#get xp
		movl 12(%ebp), %ecx	#get yp
		
		movl (%edx), %ebx	#get x
		movl (%ecx), %eax	#get y
		
		movl %eax, (%edx)
		movl %ebx, (%ecx)
		
		popl %edx
		popl %ecx
		popl %ebx
		popl %eax
		
		popl %ebp
		ret
		
.done:
		addl $20, %esp
		popl %ebx
		popl %ebp
		ret	

parray:
		pushl %ebp
		movl %esp, %ebp
		push %ebx		
		
		movl 8(%ebp), %edx	#get &array
		movl 12(%ebp), %ebx	#get len
		
		movl $0, %ecx
		cmp %ecx, %ebx
		jle .done2
.loop:
		movl (%edx, %ecx, 4), %eax
		
		call print
		
		inc %ecx
		cmp %ecx, %ebx
		jg .loop		
.done2:
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
