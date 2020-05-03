/**
 * https://leetcode.com/problems/valid-palindrome-ii/
 * 
 * 
 */ 
// Date: Sun May  3 16:10:22 PDT 2020
class Solution {
    func validPalindrome(_ s: String) -> Bool {
        var start = s.startIndex
        var end = s.index(before: s.endIndex)
        
        while start < end {
            if s[start] != s[end] {
                return isPalindrome(s, s.index(after: start), end) || isPalindrome(s, start, s.index(before: end))
            }
            start = s.index(after: start)
            end = s.index(before: end)
        }
        return true
    }
    
    private func isPalindrome(_ s: String, _ start: String.Index, _ end: String.Index) -> Bool {
        var start = start
        var end = end
        while start < end {
            if s[start] != s[end] { return false }
            start = s.index(after: start)
            end = s.index(before: end)
        }
        return true
    }
}
