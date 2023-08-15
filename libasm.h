#ifndef _LIBASM_H_
# define _LIBASM_H_

//prevent c++ name mangling:
//c++  preprocessor directives for C linkage opened
# ifdef __cplusplus
    using namespace std;
    extern "C" {
# endif

# include <stdlib.h>
size_t  ft_strlen(const char *ptr);
char    *ft_strcpy(char *dest, const char *src);

//c++  preprocessor directives for C linkage closed
# ifdef __cplusplus
    }
# endif

#endif