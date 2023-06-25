from solution import Solution

solution = Solution()

def test_example_1(nums = [2,7,11,15], target = 9):
    assert solution.twoSum(nums, target) == [0,1]

def test_example_2(nums = [3,2,4], target = 6):
    assert solution.twoSum(nums, target) == [1,2]

def test_example_3(nums = [3,3], target = 6):
    assert solution.twoSum(nums, target) == [0,1]
