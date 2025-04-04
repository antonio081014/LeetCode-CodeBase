/**
 * https://leetcode.com/problems/roman-to-integer/
 * 
 * 
 */ 
// Date: Thu Apr  3 20:50:38 PDT 2025
class Solution:
    def romanToInt(self, s: str) -> int:
        last = 1001
        sum = 0
        for index in range(len(s)):
            if s[index] == "M":
                if last == 100:
                    sum += 1000 - 100 * 2
                else:
                    sum += 1000
                last = 1000
            elif s[index] == "D":
                if last == 100:
                    sum += 500 - 100 * 2
                else:
                    sum += 500
                last = 500
            elif s[index] == "C":
                if last == 10:
                    sum += 100 - 10 * 2
                else:
                    sum += 100
                last = 100
            elif s[index] == "L":
                if last == 10:
                    sum += 50 - 10 * 2
                else:
                    sum += 50
                last = 50
            elif s[index] == "X":
                if last == 1:
                    sum += 10 - 1 * 2
                else:
                    sum += 10
                last = 10
            elif s[index] == "V":
                if last == 1:
                    sum += 5 - 1 * 2
                else:
                    sum += 5
                last = 5
            else:
                sum += 1
                last = 1
        return sum
/**
 * https://leetcode.com/problems/roman-to-integer/
 * 
 * 
 */ 
// Date: Thu Apr  3 20:55:15 PDT 2025
class Solution:
    def romanToInt(self, s: str) -> int:
        roman_to_dec = {
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        }
        sum = 0
        length = len(s)
        for index in range(length):
            if index + 1 < length and roman_to_dec[s[index]] < roman_to_dec[s[index + 1]]:
                sum -= roman_to_dec[s[index]]
            else:
                sum += roman_to_dec[s[index]]
        return sum
