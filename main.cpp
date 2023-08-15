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

int main()
{
	check_strlen();
	check_strcpy();
	return (0);
}
