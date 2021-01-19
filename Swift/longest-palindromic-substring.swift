/**
 * Problem Link: https://leetcode.com/problems/longest-palindromic-substring/
 *
 *
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let list = s.characters.map(){"\($0)"}
        var ret = ""
        for i in 0..<list.count {
            let s1 = findPalindromString(at: i, and: i, for: list)
            let s2 = findPalindromString(at: i, and: i+1, for: list)
            if s1.characters.count > ret.characters.count {
                ret = s1
            }
            if s2.characters.count > ret.characters.count {
                ret = s2
            }
        }
        return ret
    }
    
    private func findPalindromString(at left: Int, and right: Int, for s: [String]) -> String {
        var l = left
        var r = right
        var ret = ""
        while(l>=0 && r < s.count && s[l] == s[r]) {
            if l != r {
                ret = s[l] + ret + s[r]
            } else {
                ret += s[l]
            }
            l -= 1
            r += 1
        }
        return ret
    }
}
/**
 * https://leetcode.com/problems/longest-palindromic-substring/
 * 
 * 
 */ 
// Date: Tue Jan 19 09:21:21 PST 2021
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let n = s.count
        let s = Array(s)
        var dp = Array(repeating: Array(repeating: false, count: n), count: n)
        var ret = (0, 0)
        for len in 1 ... n {
            for start in 0 ... (n - len) {
                var end = start + len - 1
                if len > 2 {
                    dp[start][end] = dp[start + 1][end - 1] && (s[start] == s[end])
                } else {
                    dp[start][end] = (s[start] == s[end])
                }
                if dp[start][end], ret.1 - ret.0 + 1 < len {
                    ret = (start, end)
                }
            }
        }
        return String(s[ret.0 ... ret.1])
    }
}