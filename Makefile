##### @version $Id: Makefile 1084 2012-02-15 08:10:28Z liuzq $  #####
#######Makefile Begin#######################

TARGET := process

#Debug or Release
BUILD_TYPE := Debug

#dynamic_lib/static_lib/executable
MODULE_TYPE := executable

SRCDIRS   := .
SRCDIRS   += 

CPPFLAGS := 
CPPFLAGS += -std=c++11 -O0
#add macro
#CPPFLAGS += -D __linux__
##

COMMON_PATH := /home/shengkaishan/tmp

INCLUDES := -I./
INCLUDES += -I$(COMMON_PATH)/libev/include 
INCLUDES += -I/usr/local/ocilib/include 
INCLUDES += -I/usr/local/log4cplus/include 
INCLUDES += -I$(COMMON_PATH)/libiconv/include
INCLUDES += -I$(COMMON_PATH)/librdkafka/include
INCLUDES += -I/home/shengkaishan/code/Risk/gtja/out/include
INCLUDES += -I/home/shengkaishan/code/Risk/gtja/Trial_Server/src
INCLUDES += -I$(COMMON_PATH)/libcurl/include
INCLUDES += -I$(COMMON_PATH)/libprotobuf/include
#INCLUDES += -I$(NAUT_ROOTDIR)/out/include

LIBS := 
#LIBS += -L$(COMMON_PATH)/libev/lib -lev
#LIBS += -L/usr/local/ocilib -L/usr/local/instantclient_12_2 -lclntsh -locilib 
#LIBS += -L/usr/local/log4cplus/lib -llog4cplus
#LIBS += -L$(COMMON_PATH)/libiconv/lib -lcharset -liconv
#LIBS += -L$(NAUT_ROOTDIR)/out/lib/debug -lbase
#LIBS += -L$(COMMON_PATH)/librdkafka/lib -lrdkafka -lrdkafka++
#LIBS += -L$(COMMON_PATH)/libcurl/lib -lcurl
LIBS += -L$(COMMON_PATH)/libprotobuf/lib/static -lprotobuf
LIBS += -L./ -lprocess
LIBS += -lrt -pthread
	
include Makefile.share

### End of the Makefile 
###############################################################################

