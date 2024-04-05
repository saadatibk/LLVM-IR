define i32 @factorial(i32 %n) {
entry:
  %result = alloca i32
  store i32 1, i32* %result
  %i = alloca i32
  store i32 1, i32* %i
  br label %loop

loop:
  %current_i = load i32, i32* %i
  %current_result = load i32, i32* %result
  %cmp = icmp sle i32 %current_i, %n
  br i1 %cmp, label %body, label %exit

body:
  %next_i = add i32 %current_i, 1
  %next_result = mul i32 %current_result, %current_i
  store i32 %next_result, i32* %result
  store i32 %next_i, i32* %i
  br label %loop

exit:
  %final_result = load i32, i32* %result
  ret i32 %final_result
}
