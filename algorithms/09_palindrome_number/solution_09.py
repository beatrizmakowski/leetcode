from typing import List

class Solution:
    def isPalindrome(self, x: int) -> bool:
        number_str = str(x)
        middle_index = int(len(number_str) / 2)
        for index, char in enumerate(number_str[:middle_index]):
            if char != number_str[-index - 1]:
                return False
        return True
