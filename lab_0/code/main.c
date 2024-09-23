#include <stdio.h>
int main() {
    int num;
    unsigned long long factorial = 1; // 用于存储阶乘结果
    scanf("%d", &num);
    for (int i = 1; i <= num; i++) {
        factorial *= i; // 计算阶乘
    }
    printf("%llu\n", factorial);
    return 0;
}
