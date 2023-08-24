#ifndef _LIBASM_H_
# define _LIBASM_H_

//prevent c++ name mangling:
//c++  preprocessor directives for C linkage opened
# ifdef __cplusplus
	using namespace std;
	extern "C" {
# endif

# include <stdlib.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
}   t_list;

size_t	ft_strlen(const char *ptr);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, void const *buf, size_t count);
ssize_t	ft_read(int fd, char* buff, size_t count);
char	*ft_strdup(const char *s);
int		ft_atoi_base(const char *str, const char *base);
void	ft_list_push_front(t_list **lst, void *data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());

//c++  preprocessor directives for C linkage closed
# ifdef __cplusplus
	}
# endif

#endif