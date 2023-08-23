//
// Created by tnoulens on 8/3/23.
//

#include "libasm.h"
#include <iostream>
#include <iomanip>
#include <cstring>
#include <colors.h>
#include <errno.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>

# ifndef BONUS
#  define BONUS 0
# endif

void check_strlen()
{
	const char *empty = "";
	const char *hello_world = "Hello, world!";
	const char *alphabet = "abcdefghijklmnopqrstuvwxyz";

	cout << YELLOW << "========== FT_STRLEN ===========\n\n" << RESET;
	cout << setw(20) << left << "string" << ": " << empty << endl;
	cout << setw(20) << left << "expected lenght" << ": 0" << endl;
	cout << setw(20) << left << "libc" << ": " << strlen(empty) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strlen(empty) << endl;
	cout << endl;
	cout << setw(20) << left << "string" << ": " << hello_world << endl;
	cout << setw(20) << left << "expected lenght" << ": 13" << endl;
	cout << setw(20) << left << "libc" << ": " << strlen(hello_world) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strlen(hello_world) << endl;
	cout << endl;
	cout << setw(20) << left << "string" << ": " << alphabet << endl;
	cout << setw(20) << left << "expected lenght" << ": 26" << endl;
	cout << setw(20) << left << "libc" << ": " << strlen(alphabet) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strlen(alphabet) << endl;
	cout << endl;
}

void check_strcpy()
{
	char buffer[27];
	const char *empty = "";
	const char *hello_world = "Hello, world!";
	const char *alphabet = "abcdefghijklmnopqrstuvwxyz";

	cout << YELLOW << "========== FT_STRCPY ===========\n\n" << RESET;
	cout << setw(20) << left << "string" << empty << endl;
	cout << setw(20) << left << "copy to" << ": buffer[27]" << endl;
	cout << setw(20) << left << "libc" << ": " << strcpy(buffer, empty) << endl;
	bzero(buffer, 27);
	cout << setw(20) << left << "libasm" << ": " << ft_strcpy(buffer, empty) << endl;
	bzero(buffer, 27);
	cout << endl;
	cout << setw(20) << left << "string" << hello_world << endl;
	cout << setw(20) << left << "copy to" << ": buffer[27]" << endl;
	cout << setw(20) << left << "libc" << ": " << strcpy(buffer, hello_world) << endl;
	bzero(buffer, 27);
	cout << setw(20) << left << "libasm" << ": " << ft_strcpy(buffer, hello_world) << endl;
	bzero(buffer, 27);
	cout << endl;
	cout << setw(20) << left << "string" << alphabet << endl;
	cout << setw(20) << left << "copy to" << ": buffer[27]" << endl;
	cout << setw(20) << left << "libc" << ": " << strcpy(buffer, alphabet) << endl;
	bzero(buffer, 27);
	cout << setw(20) << left << "libasm" << ": " << ft_strcpy(buffer, alphabet) << endl;
	bzero(buffer, 27);
	cout << endl;
}

void check_strcmp()
{
	const char *empty = "";
	const char *empty2 = "";
	const char *hello_world = "Hello, world!";
	const char *hello_world2 = "Hello, world!";
	const char *hello_world3 = "Hello, world!!";
	const char *hello_world4 = "Hello, world";
	const char *alphabet = "abcdefghijklmnopqrstuvwxyz";
	const char *Alphabet = "abcdefghijklmnOpqrstuvwxyz";

	cout << YELLOW << "========== FT_STRCMP ===========\n\n" << RESET;
	cout << setw(20) << left << "string" << empty << endl;
	cout << setw(20) << left << "cmp to" << empty2 << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(empty, empty2) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(empty, empty2) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << hello_world << endl;
	cout << setw(20) << left << "cmp to" << hello_world2 << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(hello_world, hello_world2) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(hello_world, hello_world2) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << hello_world << endl;
	cout << setw(20) << left << "cmp to" << hello_world3 << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(hello_world, hello_world3) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(hello_world, hello_world3) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << hello_world << endl;
	cout << setw(20) << left << "cmp to" << hello_world4 << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(hello_world, hello_world4) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(hello_world, hello_world4) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << alphabet << endl;
	cout << setw(20) << left << "cmp to" << alphabet << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(alphabet, alphabet) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(alphabet, alphabet) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << alphabet << endl;
	cout << setw(20) << left << "cmp to" << Alphabet << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(alphabet, Alphabet) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(alphabet, Alphabet) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << Alphabet << endl;
	cout << setw(20) << left << "cmp to" << alphabet << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(Alphabet, alphabet) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(Alphabet, alphabet) << endl;
	cout << endl;
}

void	check_write()
{
	const char *empty = "";
	const char *hello_world = "Hello, world!\n";
	const char *alphabet = "abcdefghijklmnopqrstuvwxyz\n";
	int	fd = open("test.txt", O_CREAT | O_WRONLY | O_TRUNC, 0644);

	cout << YELLOW << "========== FT_WRITE ===========\n\n" << RESET;
	cout << setw(20) << left << "string" << empty << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_write(1, empty, ft_strlen(empty)) << endl;
	cout << setw(20) << left << "libc" << ": " << write(1, empty, ft_strlen(empty)) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << hello_world << "in fd test.txt" << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_write(fd, hello_world, ft_strlen(hello_world)) << endl;
	cout << setw(20) << left << "libc" << ": " << write(fd, hello_world, ft_strlen(hello_world)) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << alphabet << "on stdout" << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_write(1, alphabet, ft_strlen(alphabet)) << endl;
	cout << setw(20) << left << "libc" << ": " << write(1, alphabet, ft_strlen(alphabet)) << endl;
	cout << endl;

	cout << setw(20) << left << "MYFT ERRNO" << "9: Bad file descriptor" << endl;
	cout << setw(20) << left << "return: " << ft_write(6, "hahaha", 5) << endl;
	cout << setw(20) << left << "perror :" << endl;
	perror("My ft");
	cout << setw(20) << left << "LIBC ERRNO" << "9: Bad file descriptor" << endl;
	cout << setw(20) << left << "return: " << write(6, "hahaha", 5) << endl;
	cout << setw(20) << left << "perror :" << endl;
	perror("libc ");
	close(fd);
}

void	check_read()
{
	char buff[1000];
	char buff2[2];
	bzero(buff, 1000);
	bzero(buff2, 2);

	cout << YELLOW << "========== FT_READ ===========\n\n" << RESET;
	int	fd = open("test.txt", O_RDONLY);
	cout << BLUE << "--- My ft_read ---" << RESET << endl;

	int byrd = ft_read(fd, buff, 0);
	if (byrd == -1)
		perror("libasm ");
	cout << setw(20) << left << "Bytes read (0)" << ": " << byrd << endl;
	buff[byrd] = 0;
	cout << setw(20) << left << "Buff content" << ": " << buff << endl;

	byrd = ft_read(fd, buff, 14);
	if (byrd == -1)
		perror("libasm ");
	cout << setw(20) << left << "Bytes read (14)" << ": " << byrd << endl;
	buff[byrd] = 0;
	cout << setw(20) << left << "Buff content" << ": " << buff << endl;

	byrd = ft_read(fd, buff2, 1);
	if (byrd == -1)
		perror("libasm ");
	cout << setw(20) << left << "Bytes read (1)" << ": " << byrd << endl;
	buff[byrd] = 0;
	cout << setw(20) << left << "Buff content" << ": " << buff2 << endl;

	close(fd);

	cout << endl;

	bzero(buff, 1000);
	bzero(buff2, 2);
	fd = open("test.txt", O_RDONLY);
	cout << BLUE << "--- libc read ---" << RESET << endl;

	byrd = read(fd, buff, 0);
	if (byrd == -1)
		perror("libc");
	cout << setw(20) << left << "Bytes read (0)" << ": " << byrd << endl;
	buff[byrd] = 0;
	cout << setw(20) << left << "Buff content" << ": " << buff << endl;

	byrd = read(fd, buff, 14);
	if (byrd == -1)
		perror("libc ");
	cout << setw(20) << left << "Bytes read (14)" << ": " << byrd << endl;
	buff[byrd] = 0;
	cout << setw(20) << left << "Buff content" << ": " << buff << endl;

	byrd = read(fd, buff2, 1);
	if (byrd == -1)
		perror("libc ");
	cout << setw(20) << left << "Bytes read (1)" << ": " << byrd << endl;
	buff[byrd] = 0;
	cout << setw(20) << left << "Buff content" << ": " << buff2 << endl;

	close(fd);

	cout << fd << endl;

	cout << setw(20) << left << "The fd has been closed" << endl;
	byrd = ft_read(fd, buff, 14);
	if (byrd == -1)
		perror("libasm ");
	byrd = read(fd, buff, 14);
	if (byrd == -1)
		perror("libc ");
}

void	check_strdup()
{
	const char *test = "";
	const char *test2 = "this is the string";
	char *ret = NULL;
	char *ret2 = NULL;

	cout << YELLOW << "========== FT_STRDUP ===========\n\n" << RESET;
	ret = ft_strdup(test);
	ret2 = strdup(test);
	cout << setw(20) << left << "str to dup" << ": " << test << endl;
	cout << setw(20) << left << "ft_strdup" << ": " << ret << endl;
	cout << setw(20) << left << "strdup" << ": " << ret2 << endl;
	free(ret);
	free(ret2);
	ret = NULL;
	ret2 = NULL;
	cout << "freed" << endl;

	// char *i = NULL; // segfault
	// ret = ft_strdup(i);
	// ret2 = strdup(i);
	// cout << setw(20) << left << "str to dup" << ": NULL" << test << endl;
	// cout << setw(20) << left << "ft_strdup" << ": " << ret << endl;
	// cout << setw(20) << left << "strdup" << ": " << ret2 << endl;

	ret = ft_strdup(test2);
	ret2 = strdup(test2);
	cout << setw(20) << left << "str to dup" << ": " << test2 << endl;
	cout << setw(20) << left << "ft_strdup" << ": " << ret << endl;
	cout << setw(20) << left << "strdup" << ": " << ret2 << endl;
	free(ret);
	free(ret2);
	ret = NULL;
	ret2 = NULL;
	cout << "freed" << endl;
}

void	check_atoi_base()
{
	cout << GREEN << "========== FT_ATOI_BASE ===========\n\n" << RESET;
	cout << setw(20) << left << "str" << ": " << "-10000000000000000000000000000000" << endl;
	cout << setw(20) << left << "in base" << ": " << "01" << endl;
	cout << setw(20) << left << "expected" << ": " << -2147483648 << endl;
	cout << setw(20) << left << "ft_atoi_base" << ": " << ft_atoi_base("-10000000000000000000000000000000", "01") << endl;
	
	cout << endl;

	cout << setw(20) << left << "str" << ": " << "   --------+-2a " << endl;
	cout << setw(20) << left << "in base" << ": " << "0123456789abcdef" << endl;
	cout << setw(20) << left << "expected" << ": " << -42 << endl;
	cout << setw(20) << left << "ft_atoi_base" << ": " << ft_atoi_base("   --------+-2a ", "0123456789abcdef") << endl;
	
	cout << endl;

	cout << setw(20) << left << "str" << ": " << "   \t-+-2a" << endl;
	cout << setw(20) << left << "in base" << ": " << "0123456789abcdef" << endl;
	cout << setw(20) << left << "expected" << ": " << 42 << endl;
	cout << setw(20) << left << "ft_atoi_base" << ": " << ft_atoi_base("   \t-+-2a", "0123456789abcdef") << endl;
	
	cout << endl;

	cout << setw(20) << left << "str" << ": " << "   \t-+-101010" << endl;
	cout << setw(20) << left << "in base" << ": " << "01" << endl;
	cout << setw(20) << left << "expected" << ": " << 42 << endl;
	cout << setw(20) << left << "ft_atoi_base" << ": " << ft_atoi_base("   \t-+-101010", "01") << endl;
	
	cout << endl;

	cout << setw(20) << left << "str" << ": " << "   --------+- 2a" << endl;
	cout << setw(20) << left << "in base" << ": " << "0123456789abcdef" << endl;
	cout << setw(20) << left << "expected" << ": " << 0 << endl;
	cout << setw(20) << left << "ft_atoi_base" << ": " << ft_atoi_base("   --------+- 2a", "0123456789abcdef") << endl;
	
	cout << endl;

	cout << setw(20) << left << "str" << ": " << "   --------+-2a" << endl;
	cout << setw(20) << left << "in base" << ": " << "0123456f789abcdef" << endl;
	cout << setw(20) << left << "expected" << ": " << 0 << endl;
	cout << setw(20) << left << "ft_atoi_base" << ": " << ft_atoi_base("   --------+-2a", "0123456f789abcdef") << endl;
	
	cout << endl;
}

int main()
{
	check_strlen();
	check_strcpy();
	check_strcmp();
	check_write();
	check_read();
	check_strdup();
	if (BONUS != 0)
	{
		cout << NEG_GREEN << "\n**** BONUS ****" << RESET << "\n\n";
		check_atoi_base();
	}
	// for (int i = 0; i < 10; ++i) {
	// 	printf("  %3d: %s\n", i, strerror(i));
	// }
	return (0);
}
