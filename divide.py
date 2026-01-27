# divide.py
# This module contains a function to divide two numbers.

def divide(a, b):
    """Return the division of two numbers. Raises error if divisor is zero."""
    if b == 0:
        return "Error: Cannot divide by zero!"
    return a / b