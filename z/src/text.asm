.global _start

_start:
mov $1, %rax
mov $1, %rdi
lea logo(%rip), %rsi
mov $331, %rdx
syscall
mov $60, %rax
mov $0, %rdi
syscall

logo:
.ascii "t̵̡̢͓͔̟̦̠͉̺̗̅̓̆̈̎̽͐͐̓̄̕ę̸̢̧̧̹͓̤͓̞̪̬̱͉̳̺̪͉̥̊ͅx̵̡̩͔̪̯̘̝͈̖͙͙̹̣̮̞̤̆͋͗̃͌͛͐̈̽̃ṭ̷̡͉̝̖̩̦̹̗̥͙̺̖̪̝̹̳̬̘̮̇̌̍̆͘͜͠\n👌 😂 🎉 🚰 🫖\n􀃿  🛸 🚑 🐇 🢩 \n"
