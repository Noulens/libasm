SRCS	=	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s

FLAG	=	-Wall -Wextra -Werror
NAME	=	libasm.a
TEST	=	tester
OBJS	=	${SRCS:.s=.o}

${NAME}	:	${OBJS}
			ar rcs ${NAME} ${OBJS}
			ranlib ${NAME}

test	:	${NAME}
			g++ ${FLAG} -I. libasm.h colors.h -o ${TEST} main.cpp -L. -lasm -g

%.o		:	%.s
			nasm -f elf64 $< -o $@

lib		:	${NAME}

clean	:
			rm -f ${OBJS}

fclean	:	clean
			rm -f ${NAME}
			rm -f ${TEST}
			rm -f *.lst
			rm -f *.out
			rm -f *.o
			rm -f test.txt

re		:	fclean all

ft_strdup.o	:	ft_strdup.s
	nasm -f elf64 -g -F dwarf ft_strdup.s -l dt_strdup.lst

ft_read.o	:	ft_read.s
	nasm -f elf64 -g -F dwarf ft_read.s -l ft_read.lst

ft_write.o	:	ft_write.s
	nasm -f elf64 -g -F dwarf ft_write.s -l ft_write.lst

ft_strcpy.o	:	ft_strcpy.s
	nasm -f elf64 -g -F dwarf ft_strcpy.s -l ft_strcpy.lst

ft_strcmp.o	:	ft_strcmp.s
	nasm -f elf64 -g -F dwarf ft_strcmp.s -l ft_strcmp.lst

ft_strlen.o	:	ft_strlen.s
	nasm -f elf64 -g -F dwarf ft_strlen.s -l ft_strlen.lst

main.o	:	main.s
	nasm -f elf64 -g -F dwarf main.s -l main.lst

main		:	main.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_strlen.o ft_strdup.o
	gcc -Wall -Werror -Wextra -o test.out ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_strdup.o main.o -g

memory		:	memory.o
	gcc -Wall -Werror -Wextra -o memory.out memory.o -g -no-pie

memory.o	:	memory.s
	nasm -f elf64 -g -F dwarf memory.s -l memory.lst

better		:	better.o
	gcc -Wall -Werror -Wextra -o better.out better.o -g -no-pie

better.o	:	better.s
	nasm -f elf64 -g -F dwarf better.s -l better.lst

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
