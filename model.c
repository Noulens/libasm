/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tnoulens <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/16 17:23:23 by tnoulens          #+#    #+#             */
/*   Updated: 2022/02/16 17:23:26 by tnoulens         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

int	ft_strlen(char *str)
{
	int	lenght;

	lenght = 0;
	while (*(str + lenght))
		++lenght;
	return (lenght);
}

int	ft_checkerror(char *base)
{
	int		j;
	int		i;
	int		error;
	int		k;

	j = 0;
	i = 0;
	error = 0;
	j = ft_strlen(base);
	if (j < 2)
		error = 1;
	while (base[i])
	{
		if (base[i] == '+' || base[i] == '-' || base[i] < 32)
			error = 1;
		k = i;
		while (k < j)
		{
			if (base[k + 1] == base[i])
				error = 1;
			++k;
		}
		++i;
	}
	return (error);
}

int	ft_in_base(char c, char *base, int l)
{
	int	i;

	i = 0;
	while (i < l)
	{
		if (c == base[i])
			return (i);
		++i;
	}
	return (-1);
}

int	ft_atoi_base(char *str, char *base)
{
	int		i;
	int		sign;
	long	result;
	int		l;

	if (ft_checkerror(base) == 1)
		return (0);
	i = 0;
	sign = 1;
	while ((str[i] >= 9 && str[i] <= 13) || str[i] == ' ')
		++i;
	while (str[i] == '-' || str[i] == '+')
	{
		if (str[i] == '-')
			sign *= -1;
		++i;
	}
	l = ft_strlen(base);
	result = 0;
	while (ft_in_base(str[i], base, l) != -1 && str[i] != 0)
	{
		result = result * l + ft_in_base(str[i], base, l);
		i++;
	}
	return (result * sign);
}

#include <stdio.h>

int	main(void)
{
	printf("-2147483648:%d\n", ft_atoi_base("1000000000000000000006", "01"));
	printf("-42:%d\n", ft_atoi_base("   --------+-2a ", "0123456789abcdef"));
	printf("42:%d\n", ft_atoi_base("   -+-2a", "0123456789abcdef"));
	printf("0:%d\n", ft_atoi_base("   --------+- 2a", "0123456789abcdef"));
	printf("0:%d\n", ft_atoi_base("   --------+-", "0123456789abcdef"));
	printf("0:%d\n", ft_atoi_base("   --------+-2a", ""));
	printf("0:%d\n", ft_atoi_base("   --------+-2a", "0"));
	printf("0:%d\n", ft_atoi_base("   --------+-2a", "+-0"));
	printf("0:%d\n", ft_atoi_base("   --------+-2a", "\t01"));
}