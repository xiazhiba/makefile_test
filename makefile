#
# this file is for loader
#

ODBC_HOME=${HOME}/sude/odbc
SUDE_HOME=${HOME}/sude
INCLUDE=${SUDE_HOME}/include
LIB=${SUDE_HOME}/lib
SOFT_INCL=.
SOFT_LIB=.

CFLAGS=-I${INCLUDE} -I${SOFT_INCL} -I. -I./incl -I/usr/include/libxml2 -g -Wall -Wcast-align -Wwrite-strings -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wno-uninitialized -DTEST_MEM_ON -D_THREAD_SAFE
LDFLAGS=-L${LIB} -L${SOFT_LIB}  -lpthread -lm -lxml2
BUILD_INFO=src/build_info.o

SOFT_INCL=../incl
SOFT_LIB=../lib
CAP_BIN=${SUDE_HOME}/soft/repl/bin_debug
ODBCLIB=${SUDE_HOME}/odbclib

OBJS =  \
	src/main.o		\
	src/trans_xml.o		\

MDLIBS =	\
	${LIB}/librman.a	\
	${LIB}/libappq.a	\
	${LIB}/libacfg.a	\
	${LIB}/libpsmg.a  	\
	${LIB}/libxids.a  	\
	${LIB}/libxcfg.a  	\
	${LIB}/libxipc.a	\
	${LIB}/liblz77.a	\
	${LIB}/libxlog.a	\
	${LIB}/librq.a          \
	${LIB}/libexcp.a	\
	${LIB}/libdtm.a		\
	${LIB}/libxstk.a	\
	${LIB}/libxstr.a	\


SOFTLIBS =     


Target= ${CAP_BIN}/dip_xserver 


all: ${Target}


${Target}:  ${OBJS} ${MDLIBS} 
	${SUDE_HOME}/bin/make_build_inf_51
	${CC} ${LDFLAGS} -o $@ ${OBJS}  ${BUILD_INFO} ${SOFTLIBS} ${MDLIBS} 
	cp $@ ${SUDE_HOME}/bin

clean:
	find ./ -name \*.o -exec rm {} \;
	rm -f ${Target} 
