//
// Created by tnoulens on 8/24/23.
//

typedef struct s_list
{
	void *data;
	struct s_list *next;
}   t_list;

void    ft_list_sort(t_list **begin_list, int (*cmp)())
{
	t_list  *ptr;
	void    *tmp;

	if (!begin_list || !cmp)
		return ;
	ptr = *begin_list;
	while (ptr->next)
	{
		if (cmp(ptr->data, ptr->next->data) >= 0)
		{
			tmp = ptr->data;
			ptr->data = ptr->next->data;
			ptr->next->data = tmp;
			ptr = *begin_list;
		}
		else
			ptr = ptr->next;
	}
}
