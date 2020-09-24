/**
 * https://leetcode.com/problems/find-the-difference/
 * 
 * 
 */ 
// Date: Thu Sep 24 09:23:06 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(s.count + t.count)
    ///     - Space: O(s.count)
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var dict: [Character : Int] = [:]
        for c in s {
            dict[c] = 1 + dict[c, default: 0]
        }
        
        for c in t {
            if let v = dict[c] {
                if v == 0 { return c }
                dict[c] = v - 1
            } else {
                return c
            }
        }
        return Character("a")
    }
}