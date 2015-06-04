#plus.s
.data					# 数据段声明
		a = .int 10
		b = .int 20
.text                    # 代码段声明
.global _start           # 指定入口函数

_start
		movl a, %edx
		movl b, %ecx
		addl %ecx, %edx
		movl $1, %ebx    # 参数一：文件描述符(stdout) 
        movl $4, %eax    # 系统调用号(sys_write) 
        int  $0x80       # 调用内核功能
        
                         # 退出程序
        movl $0,%ebx     # 参数一：退出代码
        movl $1,%eax     # 系统调用号(sys_exit) 
        int  $0x80       # 调用内核功能
