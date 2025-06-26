srcdir = .
exec_prefix = /usr/local
bindir = $(exec_prefix)/bin

CC = gcc
CFLAGS = -Wall -Wextra -O2 -fPIC
LDFLAGS =

prefix = /usr/local
includedir = $(prefix)/include
libdir = $(prefix)/lib
syslibdir = /lib

SRCS = $(wildcard $(srcdir)/ferron/**/*.c)
HEADERS = $(wildcard $(srcdir)/ferron/**/*.h)
OBJS = $(addprefix obj/,$(patsubst $(srcdir)/ferron/%,obj/%,$(patsubst %.c,%.o,$(notdir $(SRCS)))))

-include config.mak

ifeq ($(wildcard config.mak),)
all:
	@echo "File config.mak not found, run configure"
	@exit 1
else

all: clean obj

obj:
	mkdir -p $@

obj/%.o: $(srcdir)/ferron/**/%.c
	$(CC) $(CFLAGS) -c $< -o $@

endif

install:
	@echo "NOT IMPL"
	exit 1

uninstall:
	@echo "NOT IMPL"
	exit 1

clean:
	rm -rf obj lib

dist-clean: clean
	rm config.mak

.PHONY: all clean dist-clean install uninstall

