#include <unistd.h>
#include <stdlib.h>
#include <string.h>

// escape codes to change tty colors
static const char gruvbox[] =
    // normal
    "\x1b]P0000000"   // black
    "\x1b]P1fb4934"   // red
    "\x1b]P2b8bb26"   // green
    "\x1b]P3fabd2f"   // brown
    "\x1b]P483a598"   // blue
    "\x1b]P5d3869b"   // magenta
    "\x1b]P68ec07c"   // cyan
    "\x1b]P7a89984"   // white

    // bright
    "\x1b]P87c6f64"   // black
    "\x1b]P9cc241d"   // red
    "\x1b]PA98971a"   // green
    "\x1b]PBd79921"   // yellow
    "\x1b]PC458588"   // blue
    "\x1b]PDb16282"   // magenta
    "\x1b]PE8ec07c"   // cyan
    "\x1b]PFd5c4a1";  // white

int main(void) {
    if(!strcmp(getenv("TERM"),"linux"))
        write(1, gruvbox, sizeof(gruvbox));

    return 0;
}
