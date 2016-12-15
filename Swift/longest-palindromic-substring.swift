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
