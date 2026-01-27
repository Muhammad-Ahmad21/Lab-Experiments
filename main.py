# main.py
# Simple Calculator using Modular Programming

from calculator import add, subtract, multiply, divide

def main():
    print("🧮 Simple Calculator")
    print("Operations: add, subtract, multiply, divide")

    # Taking input from the user
    num1 = float(input("Enter first number: "))
    num2 = float(input("Enter second number: "))
    operation = input("Enter operation: ").lower()

    # Performing calculation based on operation
    if operation == "add":
        print("Result:", add.add(num1, num2))
    elif operation == "subtract":
        print("Result:", subtract.subtract(num1, num2))
    elif operation == "multiply":
        print("Result:", multiply.multiply(num1, num2))
    elif operation == "divide":
        print("Result:", divide.divide(num1, num2))
    else:
        print("Invalid operation!")

if __name__ == "__main__":
    main()