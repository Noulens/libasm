SRCS	=	ft_strlen.s ft_strcpy.s
FLAG	=	-Wall -Wextra -Werror
NAME	=	libasm.a
TEST	=	tester
OBJS	=	${SRCS:.s=.o}

${NAME}	:	${OBJS}
			ar rcs ${NAME} ${OBJS}
			ranlib ${NAME}

all		:	${NAME}
			g++ ${FLAG} -I. libasm.h colors.h -o ${TEST} main.cpp -L. -lasm -g

%.o		:	%.s
			nasm -f elf64 $< -o $@

lib		:	${NAME}

clean	:
			rm -f ${OBJS}

fclean	:	clean
			rm -f ${NAME}
			rm -f ${TEST}

re		:	fclean all
