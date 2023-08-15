jumploop	:	jumploop.o
	gcc -Wall -Werror -Wextra -o jumploop.out jumploop.o -g -no-pie

jumploop.o	:	jumploop.s
	nasm -f elf64 -g -F dwarf jumploop.s -l jumploop.lst

jump	:	jump.o
	gcc -Wall -Werror -Wextra -o jump.out jump.o -g -no-pie

jump.o	:	jump.s
	nasm -f elf64 -g -F dwarf jump.s -l jump.lst

move	:	move.o
	gcc -Wall -Werror -Wextra -o move.out move.o -g -no-pie

move.o	:	move.s
	nasm -f elf64 -g -F dwarf move.s -l move.lst

alive	:	alive.o
	gcc -Wall -Werror -Wextra -no-pie -o alive.out alive.o -g

alive.o	:	alive.s
	nasm -f elf64 -g -F dwarf alive.s -l alive.lst

print	:	print.o
	gcc -Wall -Werror -Wextra -o print.out print.o -no-pie -g

print.o	:	print.s
	nasm -f elf64 -g -F dwarf print.s -l print.lst

hello	:	hello.o
	gcc -Wall -Werror -Wextra -o hello.out hello.o -no-pie -g

hello.o	:	hello.s
	nasm -f elf64 -g -F dwarf hello.s -l hello.lst

fclean	:
	rm -f *.out *.o *.lst
