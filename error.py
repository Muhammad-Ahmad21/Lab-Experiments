def calculate_average(numbers):
    total = 0
    for i in range(len(numbers)):
        total += numbers[i]
    average = total / len(numbers)   # Runtime Error
    return average

numbers = []   # Empty list
avg = calculate_average(numbers)
print("Average:", avg)

# Logical Error Example
sum = 0
for i in range(1, 6):
    sum = sum + 1   # Logical mistake
print("Sum:", sum)