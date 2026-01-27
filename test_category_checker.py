import unittest
from category_checker import get_category

class TestCategoryChecker(unittest.TestCase):
    """Unit tests for get_category() function."""

    def test_number(self):
        self.assertEqual(get_category("3"), "Number")

    def test_alphabet(self):
        self.assertEqual(get_category("B"), "Alphabet")

    def test_animal(self):
        self.assertEqual(get_category("Dog"), "Animal")

    def test_fruit(self):
        self.assertEqual(get_category("Mango"), "Fruit")

    def test_vegetable(self):
        self.assertEqual(get_category("Onion"), "Vegetable")

    def test_unknown(self):
        self.assertEqual(get_category("Car"), "Unknown")

if __name__ == "__main__":
    unittest.main()