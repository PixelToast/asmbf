
# This file could have been written in more
# elegant manner, but I'm fine with it's current
# state.

# Krzysztof Szewczyk, Jul 2019

CC=gcc
CFLAGS=-Ofast -march=native -funroll-loops -fomit-frame-pointer -w
TARGETS=bfasm bfi bfintd bconv

.PHONY: all clean install uninstall

all: $(TARGETS) bfasm.b bin

install:
	cp -rf bin/* /bin/

uninstall:
	cd /bin
	rm -f $(TARGETS) bfpp bfmake
	cd -

clean:
	rm -rf bin/

bfasm.b: bfasm bfasm.asm
	./bfasm < bfasm.asm > $@

bin: $(TARGETS)
	mkdir -p bin
	cp $(TARGETS) bfpp bfmake bin/
	rm -rf $(TARGETS)
	
	