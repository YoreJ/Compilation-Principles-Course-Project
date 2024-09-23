@global_var = global i32 10
@MAX_SIZE = global i32 10

declare void @putint(i32)
declare i32 @getint()
declare void @putch(i32)

define void @print_array(i32* %array, i32 %size) {
entry:
    %index = alloca i32
    store i32 0, i32* %index
    br label %while_cond

while_cond:
    %current_index = load i32, i32* %index
    %cmp = icmp slt i32 %current_index, %size
    br i1 %cmp, label %while_body, label %while_end

while_body:
    %current_index_body = load i32, i32* %index
    %index_promoted = sext i32 %current_index_body to i64
    %element_ptr = getelementptr inbounds i32, i32* %array, i64 %index_promoted
    %element = load i32, i32* %element_ptr
    call void @putint(i32 %element)
    call void @putch(i32 32)
    %next_index = add nsw i32 %current_index_body, 1
    store i32 %next_index, i32* %index
    br label %while_cond

while_end:
    call void @putch(i32 10)
    ret void
}

define void @reverse_array(i32* %array, i32 %size) {
entry:
    %index = alloca i32
    %temp = alloca i32
    store i32 0, i32* %index
    br label %while_cond

while_cond:
    %current_index = load i32, i32* %index
    %half_size = sdiv i32 %size, 2
    %cmp = icmp slt i32 %current_index, %half_size
    br i1 %cmp, label %while_body, label %while_end

while_body:
    %current_index_body = load i32, i32* %index
    %index_promoted = sext i32 %current_index_body to i64
    %element_ptr = getelementptr inbounds i32, i32* %array, i64 %index_promoted
    %element = load i32, i32* %element_ptr
    store i32 %element, i32* %temp
    %reverse_index = sub nsw i32 %size, 1
    %reverse_index_adjusted = sub nsw i32 %reverse_index, %current_index_body
    %reverse_index_promoted = sext i32 %reverse_index_adjusted to i64
    %reverse_element_ptr = getelementptr inbounds i32, i32* %array, i64 %reverse_index_promoted
    %reverse_element = load i32, i32* %reverse_element_ptr
    store i32 %reverse_element, i32* %element_ptr
    %temp_value = load i32, i32* %temp
    store i32 %temp_value, i32* %reverse_element_ptr
    %next_index = add nsw i32 %current_index_body, 1
    store i32 %next_index, i32* %index
    br label %while_cond

while_end:
    ret void
}

define i32 @main() {
entry:
    %n = alloca i32
    %arr = alloca [10 x i32]
    %index = alloca i32
    %global_var_ptr = alloca i32
    store i32 10, i32* %global_var_ptr

    %input_value = call i32 @getint()
    store i32 %input_value, i32* %n

    %n_value = load i32, i32* %n
    %global_var_value = load i32, i32* @global_var
    %cmp = icmp slt i32 %n_value, %global_var_value
    br i1 %cmp, label %if_then, label %if_else

if_then:
    %global_var_then = load i32, i32* @global_var
    call void @putint(i32 %global_var_then)
    call void @putch(i32 10)
    br label %if_end

if_else:
    store i32 20, i32* @global_var
    %global_var_else = load i32, i32* @global_var
    call void @putint(i32 %global_var_else)
    call void @putch(i32 10)
    br label %if_end

if_end:
    store i32 0, i32* %index
    br label %while_cond

while_cond:
    %current_index = load i32, i32* %index
    %max_size = load i32, i32* @MAX_SIZE
    %cmp1 = icmp slt i32 %current_index, %max_size
    br i1 %cmp1, label %while_body, label %while_end

while_body:
    %current_index_body = load i32, i32* %index
    %next_value = add nsw i32 %current_index_body, 1
    %index_promoted = sext i32 %current_index_body to i64
    %element_ptr = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 %index_promoted
    store i32 %next_value, i32* %element_ptr
    %next_index = add nsw i32 %current_index_body, 1
    store i32 %next_index, i32* %index
    br label %while_cond

while_end:
    %array_start = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 0
    %max_size_value = load i32, i32* @MAX_SIZE
    call void @print_array(i32* %array_start, i32 %max_size_value)
    call void @reverse_array(i32* %array_start, i32 %max_size_value)
    call void @print_array(i32* %array_start, i32 %max_size_value)
    ret i32 0
}