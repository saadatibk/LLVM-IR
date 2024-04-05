define i32 @sum_array(i32* %array, i32 %size) {
entry:
  %sum = alloca i32
  store i32 0, i32* %sum        ; Initialize sum to 0
  %i = alloca i32
  store i32 0, i32* %i          ; Initialize loop counter to 0
  br label %loop_entry

loop_entry:
  %current_i = load i32, i32* %i
  %cmp = icmp slt i32 %current_i, %size
  br i1 %cmp, label %loop_body, label %exit

loop_body:
  %current_sum = load i32, i32* %sum
  %array_element = getelementptr i32, i32* %array, i32 %current_i
  %element_value = load i32, i32* %array_element
  %updated_sum = add i32 %current_sum, %element_value
  store i32 %updated_sum, i32* %sum
  %next_i = add i32 %current_i, 1
  store i32 %next_i, i32* %i
  br label %loop_entry

exit:
  %final_sum = load i32, i32* %sum
  ret i32 %final_sum
}

