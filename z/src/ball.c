#include <unistd.h>

#define WIDTH 64
#define HEIGHT 32
#define BUF_SIZE (WIDTH * HEIGHT / 8)
#define RADIUS 4
#define V0_X 34
#define V0_Y 12
#define GRAVITY 98
#define DAMPER 0.8
#define FPS 60
#define DT (1.0 / FPS)

#define print(x) write(1, x, sizeof(x))
#define term(x) print(x)

#define GREEN_BOLD "\x1b[1;32m"
#define SAVE_CURSOR "\x1b[s"
#define RESTORE_CURSOR "\x1b[u"
#define CLEAR "\x1b[0J"
#define RESET "\x1b[0m"

typedef char EightPixels;
EightPixels buffer[BUF_SIZE];

#define index(x, y) (WIDTH * (y) + (x)) / 8

typedef struct { float x, y; } Vec;

Vec sum(Vec a, Vec b) {
    return (Vec){ a.x + b.x, a.y + b.y };
}

Vec scalar(Vec a, float b) {
    return (Vec){ a.x * b, a.y * b };
}

void clear(void) {
    long* ptr = (void*)buffer;
    while(ptr < (long*)buffer + BUF_SIZE)
        *ptr++ = 0;
}

void ball(Vec c, float r){
    for(int y = c.y - r; y <= c.y + r; y++)
        for(int x = c.x - r; x <= c.x + r; x++) {
            Vec d = { c.x - x, c.y - y };

            if(d.x * d.x + d.y * d.y <= r*r)
                if(0 <= x && x < WIDTH && 0 <= y && y < HEIGHT)
                    buffer[index(x, y)] |= 1 << x % 8;
        }
}

void draw(void) {
    static const char palette[] = { ' ', '_', '"', '#' };
    static char row[WIDTH + 1];

    row[WIDTH] = '\n';

    for(int y = 0; y < HEIGHT / 2; y++) {
        for(int x = 0; x < WIDTH; x++) {
            char top = (buffer[index(x, 2 * y)] & 1 << x % 8) != 0;
            char bot = (buffer[index(x, 2 * y + 1)] & 1 << x % 8) != 0;

            row[x] = palette[2 * top + bot];
        }
        print(row);
    }
}

void collisions(Vec* s, Vec* v) {
    if(s->y > HEIGHT - RADIUS) {
        s->y = HEIGHT - RADIUS;
        v->y *= -DAMPER;
        v->x *= DAMPER;
    }
}

int done(Vec s) {
    return s.x > WIDTH + RADIUS;
}

int main(void) {
    Vec s = { RADIUS, RADIUS };
    Vec v = { V0_X, V0_Y };
    Vec a = { 0, GRAVITY };

    term(GREEN_BOLD);
    term(SAVE_CURSOR);

    while(!done(s)) {
        v = sum(v, scalar(a, DT));
        s = sum(s, scalar(v, DT));
        collisions(&s, &v);

        clear();
        ball(s, RADIUS);
        draw();

        term(RESTORE_CURSOR);

        usleep(1000000/FPS);
    }

    term(CLEAR);
    print("boink\n");
    term(RESET);

    return 0;
}
