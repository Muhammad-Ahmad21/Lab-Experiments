def divide_numbers(a, b):
    try:
        result = a / b
        return result

    except ZeroDivisionError:
        print("Error: Division by zero is not allowed.")
        return None

    except ValueError:
        print("Error: Invalid input. Please enter numbers only.")
        return None

    except Exception as e:
        print("Unexpected error:", e)
        return None

    finally:
        print("Execution completed.")

try:
    num1 = int(input("Enter first number: "))
    num2 = int(input("Enter second number: "))

    result = divide_numbers(num1, num2)
    if result is not None:
        print("Result:", result)

except ValueError:
    print("Input Error: Please enter valid integers.")