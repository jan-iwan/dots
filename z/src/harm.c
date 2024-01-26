#include <unistd.h>

#define W 64
#define H 32
#define BUF_SIZE (W * H / 8)
#define RAD 3
#define FPS 60
#define DT (1.0 / FPS)
#define O ((Vec){ W / 2.0, H / 2.0 })
#define V_MIN 1
#define R_MIN 0.2
// #define DAMPER 0.9

#define R1 ((Vec){ 10, 10 })
#define R2 ((Vec){ -10, -10 })
#define V1 ((Vec){ 30, 0 })
#define V2 ((Vec){ -36, -1 })
#define M1 1
#define M2 1.8
#define K 4.0
#define B 0.3

#define print(x) write(1, x, sizeof(x))

#define COLOR "[1;32m"
#define SAVE_CURSOR "[s"
#define RESTORE_CURSOR "[u"
#define CLEAR "[0J"
#define RESET "[0m"

typedef char EightPixels;
EightPixels buffer[BUF_SIZE];

#define index(x, y) (W * (y) + (x)) / 8

typedef struct { float x, y; } Vec;

Vec sum(Vec a, Vec b) { return (Vec){ a.x + b.x, a.y + b.y }; }

Vec sub(Vec a, Vec b) { return (Vec){ a.x - b.x, a.y - b.y }; }

Vec scalar(Vec a, float b) { return (Vec){ a.x * b, a.y * b }; }

void clear(void) {
    char* ptr = (void*)buffer;
    while(ptr < (char*)buffer + BUF_SIZE)
        *ptr++ = 0;
}

void ball(Vec c, float r){
    for(int y = c.y - r; y <= c.y + r; y++)
        for(int x = c.x - r; x <= c.x + r; x++) {
            Vec d = { c.x - x, c.y - y };

            if(d.x * d.x + d.y * d.y <= r*r)
                if(0 <= x && x < W && 0 <= y && y < H)
                    buffer[index(x, y)] |= 1 << x % 8;
        }
}

void draw(void) {
    static const char palette[] = { ' ', '_', '"', '#' };
    static char row[W + 1];

    row[W] = '\n';

    for(int y = 0; y < H / 2; y++) {
        for(int x = 0; x < W; x++) {
            char top = (buffer[index(x, 2 * y)] & 1 << x % 8) != 0;
            char bot = (buffer[index(x, 2 * y + 1)] & 1 << x % 8) != 0;

            row[x] = palette[2 * top + bot];
        }
        print(row);
    }
}

Vec mov_de(Vec r, Vec v, float m) {
    r = scalar(r, -K / m);
    return sub(r, scalar(v, B / m));
}

// void collisions(Vec* r, Vec* v) {
//     if(r->y > H - RAD) {
//         r->y = H - RAD;
//         v->y *= -DAMPER;
//     }
//     if(r->y < RAD) {
//         r->y = RAD;
//         v->y *= -DAMPER;
//     }
//     if(r->x > W - RAD) {
//         r->x = W - RAD;
//         v->x *= -DAMPER;
//     }
//     if(r->x < RAD) {
//         r->x = RAD;
//         v->x *= -DAMPER;
//     }
// }

int done(Vec r, Vec v) {
    return r.x*r.x + r.y*r.y < R_MIN && v.x*v.x + v.y*v.y < V_MIN;
}

int main(void) {
    Vec r1 = R1;
    Vec v1 = V1;

    Vec r2 = R2;
    Vec v2 = V2;

    print(COLOR);
    print(SAVE_CURSOR);

    Vec cm = scalar(sum(scalar(r1, M1), scalar(r2, M2)), 1.0 / (M1 + M2));
    Vec v_cm = { 0, 0 };

    while(!done(sub(r1, r2), v1)) {
        cm = scalar(sum(scalar(r1, M1), scalar(r2, M2)), 1.0 / (M1 + M2));
        Vec fr = sub(cm, O);

        Vec a1 = mov_de(sub(r1, r2), v1, M1);
        Vec a2 = mov_de(sub(r2, r1), v2, M2);

        v1 = sum(v1, scalar(a1, DT));
        r1 = sum(r1, scalar(v1, DT));

        v2 = sum(v2, scalar(a2, DT));
        r2 = sum(r2, scalar(v2, DT));

        clear();
        ball(sub(r1, fr), RAD);
        ball(sub(r2, fr), RAD + 1);
        draw();

        print(RESTORE_CURSOR);

        usleep(1000000/FPS);
    }

    print(CLEAR);
    print("whoosh\n");
    print(RESET);

    return 0;
}
