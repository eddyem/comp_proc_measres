LOADLIBES = -lm
CC = gcc
LDFLAGS = -Wall
sources = $(wildcard *.c)

targets = $(sources:.c=)
all : $(targets)
$(targets) : $(sources)
	$(CC) $(LDFLAGS) $< $(LOADLIBES) -o $@
clean:
	/bin/rm -f $(targets)
