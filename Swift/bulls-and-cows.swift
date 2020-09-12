/**
 * https://leetcode.com/problems/bulls-and-cows/
 * 
 * 
 */ 
// Date: Thu Sep 10 09:48:02 PDT 2020
/// 1. Scan through secret to see what's in it, and count the occurence of each digit.
/// 2. Scan through guess to see if current digit is in secret, if it's in, increase B.
///     Also, if digits at the same index of two strings are identical, then increase A.
class Solution {
    /// - Complexity:
    ///     - Time: O(n + m), n is the length of secret, m is the length of guess.
    ///     - Space: O(n + m), count takes O(n), and s, g takes O(n) and O(m).
    ///
    func getHint(_ secret: String, _ guess: String) -> String {
        var count: [Character : Int] = [:]
        let s = Array(secret)
        let g = Array(guess)
        var A = 0
        var B = 0
        for index in 0 ..< s.count {
            count[s[index]] = count[s[index], default: 0] + 1
        }
        for index in 0 ..< g.count {
            if let value = count[g[index]], value > 0 {
                B += 1
                count[g[index]] = value - 1
            }
            if s[index] == g[index] {
                A += 1
            }
        }
        return "\(A)A\(B - A)B"
    }
}
