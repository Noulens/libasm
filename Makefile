SRCS	=	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s

SRCS_B	=	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s \
			ft_atoi_base.s \
			ft_list_push_front.s \
			ft_list_size.s \
			ft_list_sort.s \
			ft_list_remove_if.s

FLAG	=	-Wall -Wextra -Werror
NAME	=	libasm.a
TEST	=	test
TEST_B	=	b_test
OBJS	=	${SRCS:.s=.o}

${NAME}	:	${OBJS}
			ar rcs ${NAME} ${OBJS}
			ranlib ${NAME}

OBJS_B	=	${SRCS_B:.s=.o}

all		:	${NAME}

test	:	
			g++ ${FLAG} -I. libasm.h colors.h -o ${TEST} main.cpp -L. -lasm -g

bonus	:	${OBJS_B}
			ar rcs ${NAME} ${OBJS_B}
			ranlib ${NAME}
			gcc ${FLAG} -I. libasm.h colors.h -o ${TEST_B} main_bonus.c -L. -lasm -g
			


%.o		:	%.s
			nasm -f elf64 $< -o $@

clean	:
			rm -f ${OBJS}

fclean	:	clean
			rm -f ${NAME}
			rm -f ${TEST}
			rm -f ${TEST_B}
			rm -f *.lst
			rm -f *.out
			rm -f *.o
			rm -f test.txt

re		:	fclean bonus

.PHONY	:	re fclean bonus all test clean main

ft_list_push_front.o	:
	nasm -f elf64 -g ft_list_push_front.s

ft_atoi_base.o	:	ft_atoi_base.s
	nasm -f elf64 -g ft_atoi_base.s

ft_strdup.o	:	ft_strdup.s
	nasm -f elf64 -g ft_strdup.s

ft_read.o	:	ft_read.s
	nasm -f elf64 -g ft_read.s

ft_write.o	:	ft_write.s
	nasm -f elf64 -g ft_write.s

ft_strcpy.o	:	ft_strcpy.s
	nasm -f elf64 -g ft_strcpy.s

ft_strcmp.o	:	ft_strcmp.s
	nasm -f elf64 -g ft_strcmp.s

ft_strlen.o	:	ft_strlen.s
	nasm -f elf64 -g ft_strlen.s

ft_list_size.o : ft_list_size.s
	nasm -f elf64 -g ft_list_size.s

ft_list_sort.o : ft_list_sort.s
	nasm -f elf64 -g ft_list_sort.s

ft_list_remove_if.o : ft_list_remove_if.s
	nasm -f elf64 -g ft_list_remove_if.s

main.o	:	main.s
	nasm -f elf64 -g main.s

# TODO: remove no-pie
main		:	main.o ft_list_remove_if.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_list_size.o ft_strlen.o ft_strdup.o ft_atoi_base.o ft_list_push_front.o ft_list_sort.o
	gcc -no-pie -g -Wall -Werror -Wextra -o s.out \
	ft_strlen.o \
	ft_strcpy.o \
	ft_strcmp.o \
	ft_write.o \
	ft_read.o \
	ft_strdup.o \
	ft_atoi_base.o main.o \
	ft_list_push_front.o \
	ft_list_size.o \
	ft_list_sort.o \
	ft_list_remove_if.o



# memory		:	memory.o
# 	gcc -Wall -Werror -Wextra -o memory.out memory.o -g -no-pie

# memory.o	:	memory.s
# 	nasm -f elf64 -g -F dwarf memory.s -l memory.lst

# better		:	better.o
# 	gcc -Wall -Werror -Wextra -o better.out better.o -g -no-pie

# better.o	:	better.s
# 	nasm -f elf64 -g -F dwarf better.s -l better.lst

# jumploop	:	jumploop.o
# 	gcc -Wall -Werror -Wextra -o jumploop.out jumploop.o -g -no-pie

# jumploop.o	:	jumploop.s
# 	nasm -f elf64 -g -F dwarf jumploop.s -l jumploop.lst

# jump	:	jump.o
# 	gcc -Wall -Werror -Wextra -o jump.out jump.o -g -no-pie

# jump.o	:	jump.s
# 	nasm -f elf64 -g -F dwarf jump.s -l jump.lst

# move	:	move.o
# 	gcc -Wall -Werror -Wextra -o move.out move.o -g -no-pie

# move.o	:	move.s
# 	nasm -f elf64 -g -F dwarf move.s -l move.lst

# alive	:	alive.o
# 	gcc -Wall -Werror -Wextra -no-pie -o alive.out alive.o -g

# alive.o	:	alive.s
# 	nasm -f elf64 -g -F dwarf alive.s -l alive.lst

# print	:	print.o
# 	gcc -Wall -Werror -Wextra -o print.out print.o -no-pie -g

# print.o	:	print.s
# 	nasm -f elf64 -g -F dwarf print.s -l print.lst

# hello	:	hello.o
# 	gcc -Wall -Werror -Wextra -o hello.out hello.o -no-pie -g

# hello.o	:	hello.s
# 	nasm -f elf64 -g -F dwarf hello.s -l hello.lst
