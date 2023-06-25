from solution_09 import Solution

solution = Solution()

def test_example_1():
    solution = Solution()
    assert solution.isPalindrome(121) == True

def test_example_2():
    solution = Solution()
    assert solution.isPalindrome(-121) == False

def test_example_3():
    solution = Solution()
    assert solution.isPalindrome(10) == False

def test_example_4():
    solution = Solution()
    assert solution.isPalindrome(12345678900987654321) == True
