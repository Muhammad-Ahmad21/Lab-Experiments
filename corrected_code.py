def calculate_average(numbers):
    if len(numbers) == 0:
        return 0

    total = 0
    for i in range(len(numbers)):
        total += numbers[i]

    average = total / len(numbers)
    return average

numbers = [1, 2, 3, 4, 5]
avg = calculate_average(numbers)
print("Average:", avg)

# Fixed Logical Error
total_sum = 0
for i in range(1, 6):
    total_sum = total_sum + i
print("Sum:", total_sum)