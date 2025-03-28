/**
 * https://leetcode.com/problems/palindrome-number/
 * 
 * 
 */ 
// Date: Thu Mar 27 17:04:19 PDT 2025
class Solution:
    def isPalindrome(self, x: int) -> bool:
        text = str(x)
        start = 0
        end = len(text) - 1
        while start < end:
            if text[start] != text[end]:
                return False
            start += 1
            end -= 1
        return True
