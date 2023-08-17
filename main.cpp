//
// Created by tnoulens on 8/3/23.
//

#include "libasm.h"
#include <iostream>
#include <iomanip>
#include <cstring>
#include <colors.h>

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
	cout << setw(20) << left << "cmp to" << ": " << empty2 << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(empty, empty2) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(empty, empty2) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << hello_world << endl;
	cout << setw(20) << left << "cmp to" << ": " << hello_world2 << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(hello_world, hello_world2) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(hello_world, hello_world2) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << hello_world << endl;
	cout << setw(20) << left << "cmp to" << ": " << hello_world3 << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(hello_world, hello_world3) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(hello_world, hello_world3) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << hello_world << endl;
	cout << setw(20) << left << "cmp to" << ": " << hello_world4 << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(hello_world, hello_world4) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(hello_world, hello_world4) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << alphabet << endl;
	cout << setw(20) << left << "cmp to" << ": " << alphabet << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(alphabet, alphabet) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(alphabet, alphabet) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << alphabet << endl;
	cout << setw(20) << left << "cmp to" << ": " << Alphabet << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(alphabet, Alphabet) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(alphabet, Alphabet) << endl;
	cout << endl;

	cout << setw(20) << left << "string" << Alphabet << endl;
	cout << setw(20) << left << "cmp to" << ": " << alphabet << endl;
	cout << setw(20) << left << "libc" << ": " << strcmp(Alphabet, alphabet) << endl;
	cout << setw(20) << left << "libasm" << ": " << ft_strcmp(Alphabet, alphabet) << endl;
	cout << endl;
}

int main()
{
	check_strlen();
	check_strcpy();
	check_strcmp();
	return (0);
}
