#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include "make_log.h"

void func(int a, int b)
{
    printf("a = %d, b = %d\n", a, b);
}

int main(int argc, char *argv[])
{
    int a = 10;
    
    LOG("111", "222", "abcd %s", "123");
    LOG("111", "222", "abcd %s", "666");
    LOG("111", "222", "abcd %s", "456");
    LOG("111", "222", "abcd %s", "9999");
    LOG("111", "222", "abcd %s", "8888");
        
    
    if (a == 10) {
    	printf("a = %d\n", a);
    }

	return 0;
}
