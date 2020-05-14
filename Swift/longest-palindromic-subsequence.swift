/**
 * https://leetcode.com/problems/longest-palindromic-subsequence/
 * 
 * 
 */ 
// Date: Thu May 14 11:22:30 PDT 2020
class Solution {
    /// Dynamic Programming.
    /// isPalindromic[start][end] indicates the max length of valid palindromic substring from start to end, inclusive.
    /// - Complexity:
    ///     - Time: O(n^2), n is the length of string
    ///     - Space: O(n^2), n is the length of string
    ///
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s = Array(s)
        var isPalindromic: [[Int]] = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        for len in 1 ... s.count {
            for start in 0 ... (s.count - len) {
                let end = start + len - 1
                if len == 1 {
                    isPalindromic[start][end] = 1
                } else {
                    isPalindromic[start][end] = max(isPalindromic[start][end], isPalindromic[start + 1][end])
                    isPalindromic[start][end] = max(isPalindromic[start][end], isPalindromic[start][end - 1])
                    if s[start] == s[end] {
                        isPalindromic[start][end] = max(isPalindromic[start][end], isPalindromic[start + 1][end - 1] + 2)
                    }
                }
            }
        }
        return isPalindromic[0][s.count - 1]
    }
}
/**
 * https://leetcode.com/problems/longest-palindromic-subsequence/
 * 
 * 
 */ 
// Date: Thu May 14 11:31:15 PDT 2020
class Solution {
    /// Faster with less comparison function `max` used.
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s = Array(s)
        var isPalindromic: [[Int]] = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        for len in 1 ... s.count {
            for start in 0 ... (s.count - len) {
                let end = start + len - 1
                if len == 1 {
                    isPalindromic[start][end] = 1
                } else {
                    if s[start] == s[end] {
                        isPalindromic[start][end] = max(isPalindromic[start][end], isPalindromic[start + 1][end - 1] + 2)
                    } else {
                        isPalindromic[start][end] = max(isPalindromic[start][end - 1], isPalindromic[start + 1][end])
                    }
                }
            }
        }
        return isPalindromic[0][s.count - 1]
    }
}
