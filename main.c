//
// Created by tnoulens on 8/3/23.
//

#include "libasm.h"
#include <stdio.h>
#include <string.h>

int main()
{
	const char  *alphabet = "abcdefghijklmnopqrstuvwxyz";
	const int   strlen_res = strlen(alphabet);
	const int   ft_strlen_res = ft_strlen(alphabet);

	printf("Testing strlen with %s:\n", alphabet);
	printf("%d\n", strlen_res);
	printf("Testing ft_strlen with %s:\n", alphabet);
	printf("%d\n", ft_strlen_res);

	char tester_ft[27];
	char tester[27];
	strcpy(tester, alphabet);
	ft_strcpy(tester_ft, alphabet);
	printf("Testing ft_strcpy with %s:\n%s\n", alphabet, tester_ft);
	printf("Testing strcpy with %s:\n%s\n", alphabet, tester);
	return (0);
}
