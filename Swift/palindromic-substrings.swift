/**
 * https://leetcode.com/problems/palindromic-substrings/
 * 
 * 
 */ 
// Date: Thu May 14 10:17:59 PDT 2020
class Solution {
    /// Dynamic Programming.
    /// isPalindromic[start][end] indicates: if substring between start and end, inclusive, is palindromic.
    /// - Complexity:
    ///     - Time: (n^2), n is the length of string
    ///     - Space: (n^2), n is the length of string
    ///
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        var isPalindromic: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var ret = 0
        for len in 1 ... s.count {
            for start in 0 ... (s.count - len) {
                let end = start + len - 1
                if len == 1 {
                    isPalindromic[start][end] = true
                } else if len == 2, s[start] == s[end] {
                    isPalindromic[start][end] = true
                } else if s[start] == s[end], isPalindromic[start + 1][end - 1] == true {
                    isPalindromic[start][end] = true
                }
                if isPalindromic[start][end] {
                    ret += 1
                }
            }
        }
        return ret
    }
}

class Solution {
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        var count = 0
        for index in 0 ..< s.count {
            count += palindromicCount(s, index, index)
            count += palindromicCount(s, index, index + 1)
        }
        return count
    }
    
    private func palindromicCount(_ s: [Character], _ left: Int, _ right: Int) -> Int {
        var left = left
        var right = right
        var result = 0
        while left >= 0, right < s.count, s[left] == s[right] {
            result += 1
            left -= 1
            right += 1
        }
        return result
    }
}
