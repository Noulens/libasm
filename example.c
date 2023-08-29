//
// Created by tnoulens on 8/29/23.
//

typedef struct s_list
{
	struct s_list	*next;
	void			*data;
}t_list;

void	ft_list_sort(t_list **begin_list, int (*cmp)())
{
	t_list	*ptr;
	void	*temp;

	ptr = *begin_list;
	if (!ptr)
		return ;
	while (ptr->next)
	{
		if (cmp(ptr->data, ptr->next->data) > 0)
		{
			temp = ptr->data;
			ptr->data = ptr->next->data;
			ptr->next->data = temp;
			ptr = *begin_list;
		}
		else
			ptr = ptr->next;
	}
}
