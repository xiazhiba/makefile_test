#first demo

SUDE_HOME=$(HOME)/sude
INCLUDE=$(SUDE_HOME)/include
LIB=$(SUDE_HOME)/lib

CFLAGS= -I$(INCLUDE) -I/usr/include/libxml2 
LDFLAGS= -L$(LIB) -L/usr/lib/libxml2    -lz -lxml2 


OBJS = ./src/main.o \
			 ./src/read_q.o


readq: $(OBJS)
	cc -o readq $(OBJS) $(CFLAGS) $(LDFLAGS)

$(OBJS): headers.h

# .PHONY 特殊目标将clean目标声明为伪目标，防止当磁盘上存在一个名为clean的文件时，clean所在规则的命令无法执行
# 命令前加"-",意思是忽略命令rm的执行错误
.PHONY:clean
clean:
	-rm $(OBJS) readq
