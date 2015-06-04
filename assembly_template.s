.section .data

#x是占位符
output:
    .ascii "The processor Vendor ID is: 'xxxxxxxxxx'\n"

#_start和output都是标签
.section .text

#如果用gcc编译的话,_start要改为main
.global _start
_start:
    movl $0, %eax
    cpuid

#相当于把字符串output的地址传入到寄存器edi中.
movl $output, %edi

#将调用cpuid命令的内容放入指定的内存
movl %ebx, 28(%edi)
movl %edx, 32(%edi)
movl %ecx, 36(%edi)

#4表示系统调用的值,1表示文件描述符, output是输入的字符
movl $4, %eax
movl $1, %ebx
movl $output, %ecx
movl $42, %edx

#"int $0x80"是系统调用中断 
int $0x80
movl $1, %eax
movl $0, %ebx
int $0x80


#编译
#as -o cpuid.o assembly_template.s 
#ld -o cpuid cpuid.o

#执行
#./cpuid

#输出
#The processor Vendor ID is: GenuineIntel

