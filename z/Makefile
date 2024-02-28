CC := gcc
CFLAGS := -Os

AS := as

all: c asm

c: b h s

asm: t

%: src/%*.c
	$(CC) $(CFLAGS) -o $@ $^
	strip $@

%: src/%*.asm
	$(AS) -o $@ $^
	strip $@
