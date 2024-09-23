#include <stdio.h>
#include <stdarg.h>
#include <time.h>

void putf(const char *format, ...) {
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}

void putch(int ch) {
    putchar(ch);
}

double getfloat() {
    double f;
    scanf("%lf", &f);
    return f;
}

static clock_t start_time;

void starttime() {
    start_time = clock();
}

void stoptime() {
    clock_t end_time = clock();
    double time_spent = (double)(end_time - start_time) / CLOCKS_PER_SEC;
    printf("Time elapsed: %f seconds\n", time_spent);
}