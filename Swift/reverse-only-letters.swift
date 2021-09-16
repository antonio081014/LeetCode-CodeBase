/**
 * https://leetcode.com/problems/reverse-only-letters/
 * 
 * 
 */ 
// Date: Wed Sep 15 23:30:41 PDT 2021
class Solution {
    func reverseOnlyLetters(_ s: String) -> String {
        var s = Array(s)
        var start = 0
        var end = s.count - 1
        while start < end {
            while start < end, s[start].isLetter == false { start += 1 }
            while start < end, s[end].isLetter == false { end -= 1 }
            let tmp = s[start]
            s[start] = s[end]
            s[end] = tmp
            start += 1
            end -= 1
        }
        return String(s)
    }
}