#include "libasm.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>


void	print_all(t_list *elem)
{
	t_list *tmp = elem;
	while (tmp)
	{
		printf("%s\n", (char *)tmp->data); 
		tmp = tmp->next;
	}
}

void	check_list_push_front()
{
	const char *str = "La phrase";
	const char *str2 = "L'autre phrase";
	t_list	*begin = NULL;

	begin = malloc(sizeof(t_list));
	begin->data = (void *)str;
	begin->next = NULL;

	print_all(begin);
	ft_push_front(&begin, (void *)str2);
	print_all(begin);
	ft_push_front(&begin, (void *)"another sentence");
	print_all(begin);


	typedef struct s_test
	{
		int			nb;
		const char	*str;
	} t_test;

	t_test *t1 = malloc(sizeof(t_test));
	t1->nb = 123;
	t1->str = "surprise";

	t_test t2;
	t2.nb = 456;
	t2.str = "another surprise";

	t_list	*begin2 = NULL;
	begin2 = malloc(sizeof(t_list));
	begin2->data = (void *)t1;
	begin2->next = NULL;

	t_test *ts1 = (t_test *)begin2->data;
	ft_push_front(&begin2, (void *)&t2);
	ts1 = (t_test *)begin2->data;
    printf("%d\n", ts1->nb);
	ft_list_sort(&begin, &strcmp);
}


int main()
{
    check_list_push_front();
    return 0;
}