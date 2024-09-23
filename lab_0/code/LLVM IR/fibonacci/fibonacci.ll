declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)

define i32 @main() {
entry:
    %fib_a = alloca i32 ; 分配内存，%fib_a是一个指针，指向分配的内存
    %fib_b = alloca i32
    %index = alloca i32
    %temp = alloca i32
    %num = alloca i32

    store i32 0, i32* %fib_a ; 将0存储到%fib_a指向的地址中
    store i32 1, i32* %fib_b
    store i32 1, i32* %index

    %num_value = call i32 @getint()
    store i32 %num_value, i32* %num

    %fib_a_val = load i32, i32* %fib_a
    call void @putint(i32 %fib_a_val)
    call void @putch(i32 10)

    %fib_b_val = load i32, i32* %fib_b
    call void @putint(i32 %fib_b_val)
    call void @putch(i32 10)

    ; 进入while循环，index < num
    br label %while_condition

while_condition:
    %index_val = load i32, i32* %index
    %num_val = load i32, i32* %num
    %cmp = icmp slt i32 %index_val, %num_val
    br i1 %cmp, label %while_body, label %while_end

while_body:
    ; temp = fib_b
    %fib_b_val2 = load i32, i32* %fib_b
    store i32 %fib_b_val2, i32* %temp

    ; fib_b = fib_a + fib_b
    %fib_a_val2 = load i32, i32* %fib_a
    %sum = add i32 %fib_a_val2, %fib_b_val2
    store i32 %sum, i32* %fib_b

    ; 输出fib_b值
    call void @putint(i32 %sum)
    call void @putch(i32 10)

    ; fib_a = temp
    %temp_val = load i32, i32* %temp
    store i32 %temp_val, i32* %fib_a

    ; index = index + 1
    %index_val2 = load i32, i32* %index
    %next_index = add i32 %index_val2, 1
    store i32 %next_index, i32* %index

    br label %while_condition

while_end:
    ret i32 0
}