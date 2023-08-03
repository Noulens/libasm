SRCS	=	ft_strlen.s
FLAG	=	-Wall -Wextra -Werror
NAME	=	libasm.a
OBJS	=	${SRCS:.s=.o}

${NAME}	:	${OBJS}
			ar rcs ${NAME} ${OBJS}
			ranlib ${NAME}

all		:	${NAME}

%.o		:	%.s
			nasm -f elf64 $< -o $@

clean	:
			rm -f ${OBJS}

fclean	:	clean
			rm -f ${NAME}

re		:	fclean all

try		:	all
			gcc ${FLAG} -I. libasm.h -o try_libasm main.c -L. -lasm -g