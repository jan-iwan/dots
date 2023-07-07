#include <unistd.h>

#define WIDTH 64
#define HEIGHT 32
#define BUF_SIZE (WIDTH * HEIGHT / 8)
#define RADIUS 4
#define FPS 60
#define DT (1.0 / FPS)
#define V0 ((Vec){ 94, 29 })
#define R0 ((Vec){ WIDTH / 8.0, HEIGHT / 5.0 })
#define R_EQ ((Vec){ WIDTH / 2.0, HEIGHT / 2.0 })
#define V_MIN 0.01
#define GRAVITY 98
#define DAMPER 0.8
#define K 4.0
#define M 0.5
#define B 0.1

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
    buffer[index((int)R_EQ.x, (int)R_EQ.y)] |= 1 << (int)R_EQ.x % 8;

    for(int y = 0; y < HEIGHT / 2; y++) {
        for(int x = 0; x < WIDTH; x++) {
            char top = (buffer[index(x, 2 * y)] & 1 << x % 8) != 0;
            char bot = (buffer[index(x, 2 * y + 1)] & 1 << x % 8) != 0;

            row[x] = palette[2 * top + bot];
        }
        print(row);
    }
}

Vec mov_de(Vec r, Vec v) {
    r = sum(r, scalar(R_EQ, -1));
    r = scalar(r, -1 / M);
    v = scalar(v, -B / M);
    return sum(r, v);
}

void collisions(Vec* r, Vec* v) {
    if(r->y > HEIGHT - RADIUS) {
        r->y = HEIGHT - RADIUS;
        v->y *= -DAMPER;
    }
    if(r->y < RADIUS) {
        r->y = RADIUS;
        v->y *= -DAMPER;
    }
    if(r->x > WIDTH - RADIUS) {
        r->x = WIDTH - RADIUS;
        v->x *= -DAMPER;
    }
    if(r->x < RADIUS) {
        r->x = RADIUS;
        v->x *= -DAMPER;
    }
}

int done(Vec r) {
    // return r.x > WIDTH + RADIUS;
    return 0;
}

int main(void) {
    Vec r = R0;
    Vec v = V0;
    Vec a = { 0, 0 };

    term(GREEN_BOLD);
    term(SAVE_CURSOR);

    while(!done(r)) {
        a = mov_de(r, v);
        v = sum(v, scalar(a, DT));
        r = sum(r, scalar(v, DT));

        collisions(&r, &v);

        clear();
        ball(r, RADIUS);
        draw();

        term(RESTORE_CURSOR);

        usleep(1000000/FPS);
    }

    term(CLEAR);
    print("boink\n");
    term(RESET);

    return 0;
}
