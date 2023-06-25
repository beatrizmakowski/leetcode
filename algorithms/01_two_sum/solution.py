from typing import List

class Solution(object):

    def twoSum(self, nums: List[int], target:int) -> List[int]:
        for first_index, first_number in enumerate(nums):
            starting_index = first_index + 1
            for second_index, second_number in enumerate(nums[(starting_index):]):
                if first_number + second_number == target:
                    return [first_index, second_index + starting_index]
