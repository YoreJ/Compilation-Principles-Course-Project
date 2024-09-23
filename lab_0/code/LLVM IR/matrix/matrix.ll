@ROW_A = constant i32 2
@COL_A = constant i32 3
@ROW_B = constant i32 3
@COL_B = constant i32 2

declare void @putf(i8*, ...)
declare void @putch(i32)
declare double @getfloat()
declare void @starttime()
declare void @stoptime()

define void @matrix_multiply(double* %A, double* %B, double* %C) {
entry:
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    %k = alloca i32, align 4
    store i32 0, i32* %i, align 4
    br label %init_outer_loop

init_outer_loop:
    %i_val = load i32, i32* %i, align 4
    %i_cmp = icmp slt i32 %i_val, 2
    br i1 %i_cmp, label %init_inner_loop, label %init_outer_loop_end

init_inner_loop:
    store i32 0, i32* %j, align 4
    br label %init_inner_loop_body

init_inner_loop_body:
    %j_val = load i32, i32* %j, align 4
    %j_cmp = icmp slt i32 %j_val, 2
    br i1 %j_cmp, label %init_inner_loop_store, label %init_inner_loop_end

init_inner_loop_store:
    %i_val_inner = load i32, i32* %i, align 4
    %j_val_inner = load i32, i32* %j, align 4
    %c_idx = mul i32 %i_val_inner, 2
    %c_idx1 = add i32 %c_idx, %j_val_inner
    %c_ptr = getelementptr inbounds double, double* %C, i32 %c_idx1
    store double 0.0, double* %c_ptr, align 8

    %j_val_inc = add i32 %j_val, 1
    store i32 %j_val_inc, i32* %j, align 4
    br label %init_inner_loop_body

init_inner_loop_end:
    %i_val_inc = add i32 %i_val, 1
    store i32 %i_val_inc, i32* %i, align 4
    br label %init_outer_loop

init_outer_loop_end:
    store i32 0, i32* %i, align 4
    br label %outer_loop


outer_loop:
    %i_val2 = load i32, i32* %i, align 4
    %i_cmp2 = icmp slt i32 %i_val2, 2
    br i1 %i_cmp2, label %inner_loop, label %outer_loop_end

inner_loop:
    store i32 0, i32* %j, align 4
    br label %inner_loop_body

inner_loop_body:
    %j_val2 = load i32, i32* %j, align 4
    %j_cmp2 = icmp slt i32 %j_val2, 2
    br i1 %j_cmp2, label %inner_loop_compute, label %inner_loop_end

inner_loop_compute:
    store i32 0, i32* %k, align 4
    br label %compute_loop

compute_loop:
    %k_val = load i32, i32* %k, align 4
    %k_cmp = icmp slt i32 %k_val, 3
    br i1 %k_cmp, label %compute_body, label %compute_loop_end

compute_body:
    %i_val3 = load i32, i32* %i, align 4
    %k_val2 = load i32, i32* %k, align 4
    %a_idx = mul i32 %i_val3, 3
    %a_idx1 = add i32 %a_idx, %k_val2
    %a_ptr = getelementptr inbounds double, double* %A, i32 %a_idx1
    %a_val = load double, double* %a_ptr, align 8

    %k_val3 = load i32, i32* %k, align 4
    %j_val3 = load i32, i32* %j, align 4
    %b_idx = mul i32 %k_val3, 2
    %b_idx1 = add i32 %b_idx, %j_val3
    %b_ptr = getelementptr inbounds double, double* %B, i32 %b_idx1
    %b_val = load double, double* %b_ptr, align 8

    %mul_val = fmul double %a_val, %b_val

    %i_val4 = load i32, i32* %i, align 4
    %j_val4 = load i32, i32* %j, align 4
    %c_idx2 = mul i32 %i_val4, 2
    %c_idx3 = add i32 %c_idx2, %j_val4
    %c_ptr2 = getelementptr inbounds double, double* %C, i32 %c_idx3
    %c_val = load double, double* %c_ptr2, align 8
    %add_val = fadd double %c_val, %mul_val
    store double %add_val, double* %c_ptr2, align 8

    %k_val_inc = add i32 %k_val, 1
    store i32 %k_val_inc, i32* %k, align 4
    br label %compute_loop

compute_loop_end:
    %j_val_inc2 = add i32 %j_val2, 1
    store i32 %j_val_inc2, i32* %j, align 4
    br label %inner_loop_body

inner_loop_end:
    %i_val_inc2 = add i32 %i_val2, 1
    store i32 %i_val_inc2, i32* %i, align 4
    br label %outer_loop

outer_loop_end:
    ret void
}

define i32 @main() {
entry:
    %A = alloca [6 x double], align 16
    %B = alloca [6 x double], align 16
    %C = alloca [4 x double], align 16
    %i = alloca i32, align 4
    %j = alloca i32, align 4

    call void (i8*, ...) @putf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i32 0, i32 0), i32 6)
    store i32 0, i32* %i, align 4
    br label %input_loop_A

input_loop_A:
    %i_val = load i32, i32* %i, align 4
    %i_cmp = icmp slt i32 %i_val, 2
    br i1 %i_cmp, label %input_inner_loop_A, label %input_loop_A_end

input_inner_loop_A:
    store i32 0, i32* %j, align 4
    br label %input_inner_loop_A_body

input_inner_loop_A_body:
    %j_val = load i32, i32* %j, align 4
    %j_cmp = icmp slt i32 %j_val, 3
    br i1 %j_cmp, label %input_inner_loop_A_store, label %input_inner_loop_A_end

input_inner_loop_A_store:
    %i_val_inner = load i32, i32* %i, align 4
    %j_val_inner = load i32, i32* %j, align 4
    %a_idx = mul i32 %i_val_inner, 3
    %a_idx1 = add i32 %a_idx, %j_val_inner
    %a_ptr = getelementptr inbounds double, double* %A, i32 %a_idx1
    %a_val = call double @getfloat()
    store double %a_val, double* %a_ptr, align 8

    %j_val_inc = add i32 %j_val, 1
    store i32 %j_val_inc, i32* %j, align 4
    br label %input_inner_loop_A_body

input_inner_loop_A_end:
    %i_val_inc = add i32 %i_val, 1
    store i32 %i_val_inc, i32* %i, align 4
    br label %input_loop_A

input_loop_A_end:
    call void (i8*, ...) @putf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str1, i32 0, i32 0), i32 6)
    store i32 0, i32* %i, align 4
    br label %input_loop_B


input_loop_B:
    %i_val2 = load i32, i32* %i, align 4
    %i_cmp2 = icmp slt i32 %i_val2, 3
    br i1 %i_cmp2, label %input_inner_loop_B, label %input_loop_B_end

input_inner_loop_B:
    store i32 0, i32* %j, align 4
    br label %input_inner_loop_B_body

input_inner_loop_B_body:
    %j_val2 = load i32, i32* %j, align 4
    %j_cmp2 = icmp slt i32 %j_val2, 2
    br i1 %j_cmp2, label %input_inner_loop_B_store, label %input_inner_loop_B_end

input_inner_loop_B_store:
    %i_val_inner2 = load i32, i32* %i, align 4
    %j_val_inner2 = load i32, i32* %j, align 4
    %b_idx = mul i32 %i_val_inner2, 2
    %b_idx1 = add i32 %b_idx, %j_val_inner2
    %b_ptr = getelementptr inbounds double, double* %B, i32 %b_idx1
    %b_val = call double @getfloat()
    store double %b_val, double* %b_ptr, align 8

    %j_val_inc2 = add i32 %j_val2, 1
    store i32 %j_val_inc2, i32* %j, align 4
    br label %input_inner_loop_B_body

input_inner_loop_B_end:
    %i_val_inc2 = add i32 %i_val2, 1
    store i32 %i_val_inc2, i32* %i, align 4
    br label %input_loop_B


input_loop_B_end:
    call void @starttime()
    %a_ptr_start = getelementptr inbounds [6 x double], [6 x double]* %A, i32 0, i32 0
    %b_ptr_start = getelementptr inbounds [6 x double], [6 x double]* %B, i32 0, i32 0
    %c_ptr_start = getelementptr inbounds [4 x double], [4 x double]* %C, i32 0, i32 0
    call void @matrix_multiply(double* %a_ptr_start, double* %b_ptr_start, double* %c_ptr_start)
    call void @stoptime()
    call void (i8*, ...) @putf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str2, i32 0, i32 0))
    store i32 0, i32* %i, align 4
    br label %output_loop_C

output_loop_C:
    %i_val3 = load i32, i32* %i, align 4
    %i_cmp3 = icmp slt i32 %i_val3, 2
    br i1 %i_cmp3, label %output_inner_loop_C, label %output_loop_C_end

output_inner_loop_C:
    store i32 0, i32* %j, align 4
    br label %output_inner_loop_C_body

output_inner_loop_C_body:
    %j_val3 = load i32, i32* %j, align 4
    %j_cmp3 = icmp slt i32 %j_val3, 2
    br i1 %j_cmp3, label %output_inner_loop_C_print, label %output_inner_loop_C_end

output_inner_loop_C_print:
    %i_val_inner3 = load i32, i32* %i, align 4
    %j_val_inner3 = load i32, i32* %j, align 4
    %c_idx2 = mul i32 %i_val_inner3, 2
    %c_idx3 = add i32 %c_idx2, %j_val_inner3
    %c_ptr2 = getelementptr inbounds double, double* %C, i32 %c_idx3
    %c_val = load double, double* %c_ptr2, align 8
    call void (i8*, ...) @putf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str3, i32 0, i32 0), double %c_val)

    %j_val_inc3 = add i32 %j_val3, 1
    store i32 %j_val_inc3, i32* %j, align 4
    %j_cmp4 = icmp slt i32 %j_val_inc3, 2
    br i1 %j_cmp4, label %output_space, label %output_newline

output_space:
    call void @putch(i32 32)
    br label %output_inner_loop_C_body

output_newline:
    call void @putch(i32 10)
    br label %output_inner_loop_C_body

output_inner_loop_C_end:
    %i_val_inc3 = add i32 %i_val3, 1
    store i32 %i_val_inc3, i32* %i, align 4
    br label %output_loop_C

output_loop_C_end:
    ret i32 0
}

@.str = private unnamed_addr constant [51 x i8] c"请输入矩阵 A 的元素，共 %d 个元素：\0A\00", align 1
@.str1 = private unnamed_addr constant [51 x i8] c"请输入矩阵 B 的元素，共 %d 个元素：\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"矩阵乘法结果为：\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%f \00", align 1