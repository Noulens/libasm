#include "libasm.h"
#include <string.h>
#include <colors.h>
#include <errno.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>


void printf_list(t_list *list)
{
	while (list)
	{
		printf("%s\n", (const char *)list->data);
		list = list->next;
	}
}


void    ft_lstclear(t_list **list)
{
	t_list	*tmp;

	while (*list)
	{
		tmp = (*list)->next;
		if ((*list)->data)
			free((*list)->data);
		free(*list);
		*list = tmp;
	}
}

int		main(void)
{

	t_list	*begin = NULL;

    printf(YELLOW"\nFT_ATOI_BASE\n"RESET);
	printf("-2147483648:%d\n", ft_atoi_base("-10000000000000000000000000000000", "01"));
	printf("2147483647:%d\n", ft_atoi_base("1111111111111111111111111111111", "01"));
    printf("42:%d\n", ft_atoi_base("101010", "01"));
	printf("-42:%d\n", ft_atoi_base("   --------+-2a ", "0123456789abcdef"));
	printf("42:%d\n", ft_atoi_base("   -+-2a", "0123456789abcdef"));
	printf("0:%d\n", ft_atoi_base("   --------+- 2a", "0123456789abcdef"));
	printf("0:%d\n", ft_atoi_base("   --------+-", "0123456789abcdef"));
	printf("0:%d\n", ft_atoi_base("   --------+-2a", ""));
	printf("0:%d\n", ft_atoi_base("   --------+-2a", "0"));
	printf("0:%d\n", ft_atoi_base("   --------+-2a", "+-0"));
	printf("0:%d\n", ft_atoi_base("   --------+-2a", "\t01"));


	printf(YELLOW"\nFT_LIST_SORT & FT_PUSH & FT_SIZE\n"RESET);
    printf("size before push (NULL): %d\n", ft_list_size(begin));
	ft_list_push_front(&begin, ft_strdup("f"));
	ft_list_push_front(&begin, ft_strdup("0"));
	ft_list_push_front(&begin, ft_strdup("a"));
	ft_list_push_front(&begin, ft_strdup("3"));
    ft_list_push_front(&begin, ft_strdup("aa"));
	ft_list_push_front(&begin, ft_strdup("j"));
	ft_list_push_front(&begin, ft_strdup("b"));
    ft_list_push_front(&begin, ft_strdup("jkl"));
	ft_list_push_front(&begin, ft_strdup("h"));
	ft_list_push_front(&begin, ft_strdup("c"));
	ft_list_push_front(&begin, ft_strdup("e"));
	ft_list_push_front(&begin, ft_strdup("g"));
	ft_list_push_front(&begin, ft_strdup("2"));
	ft_list_push_front(&begin, ft_strdup("i"));
	ft_list_push_front(&begin, ft_strdup("k"));
	ft_list_push_front(&begin, ft_strdup("8"));
	ft_list_push_front(&begin, ft_strdup("d"));
    ft_list_push_front(&begin, ft_strdup("bb"));
    ft_list_push_front(&begin, ft_strdup("cde"));
    printf("size of list: %d\n", ft_list_size(begin));
	printf("before:\n");
	printf_list(begin);
	ft_list_sort(&begin, &ft_strcmp);
	printf("after:\n");
	printf_list(begin);
	ft_lstclear(&begin);
	printf("test NULL:\n");
	ft_list_sort(NULL, &ft_strcmp);
	ft_list_sort(&begin, NULL);
	printf("finish\n");

	return (0);
}