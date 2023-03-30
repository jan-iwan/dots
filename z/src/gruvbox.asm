// change tty colors
.global _start

_start:
mov $1, %rax
mov $1, %rdi
lea gruvbox(%rip), %rsi
mov $165, %rdx
syscall
mov $60, %rax
mov $0, %rdi
syscall

gruvbox:
.ascii "\x1b]P0000000\x1b]P1fb4934\x1b]P2b8bb26\x1b]P3fabd2f\x1b]P483a598\x1b]P5d3869b\x1b]P68ec07c\x1b]P7a89984\x1b]P87c6f64\x1b]P9cc241d\x1b]PA98971a\x1b]PBd79921\x1b]PC458588\x1b]PDb16282\x1b]PE8ec07c\x1b]PFd5c4a1\0"
