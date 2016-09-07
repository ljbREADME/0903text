
CC=gcc
CPPFLAGS= -I./include -I/usr/local/include/hiredis/ -I/usr/local/include/
CFLAGS=-Wall 
LIBS=-lhiredis -lpthread -lfcgi 

#找到当前目录下所有的.c文件
src = $(wildcard *.c)

#将当前目录下所有的.c  转换成.o给obj
obj = $(patsubst %.c, %.o, $(src))

redis_test=test/redis_test
fdfs_test=test/fdfs_test
test=main
fastCGI_test=test/fastCGI_test
echo=test/echo

target=$(test) $(fdfs_test) $(redis_test) $(fastCGI_test) $(echo)


ALL:$(target)


#生成所有的.o文件
$(obj):%.o:%.c
	$(CC) -c $< -o $@ $(CPPFLAGS) $(CFLAGS) 


#test_main程序
$(test): test_main.o make_log.o
	$(CC) $^ -o $@ $(LIBS)

#fdfs_test程序
$(fdfs_test): test/fdfs_client_test.o make_log.o
	$(CC) $^ -o $@ $(LIBS)

#redis_test程序
$(redis_test): test/test_redis_api.o make_log.o
	$(CC) $^ -o $@ $(LIBS)

#ct程序
$(fastCGI_test): test/fastCGI_test.o make_log.o
	$(CC) $^ -o $@ $(LIBS)

#echo程序
$(echo): test/echo.o make_log.o
	$(CC) $^ -o $@ $(LIBS)

clean:
	-rm -rf $(obj) $(target) ./test/*.o

distclean:
	-rm -rf $(obj) $(target) ./test/*.o

#将clean目标 改成一个虚拟符号
.PHONY: clean ALL distclean
