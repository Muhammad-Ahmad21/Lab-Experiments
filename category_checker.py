def get_category(item):
    """Return the category of the given item."""
    
    numbers = ["1", "2", "3", "4", "5"]
    alphabets = ["A", "B", "C", "D", "E"]
    animals = ["Cat", "Dog", "Lion", "Cow", "Goat"]
    fruits = ["Apple", "Banana", "Mango", "Orange"]
    vegetables = ["Carrot", "Potato", "Tomato", "Onion"]

    if item in numbers:
        return "Number"
    elif item in alphabets:
        return "Alphabet"
    elif item in animals:
        return "Animal"
    elif item in fruits:
        return "Fruit"
    elif item in vegetables:
        return "Vegetable"
    else:
        return "Unknown"