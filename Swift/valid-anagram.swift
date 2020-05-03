/**
 * https://leetcode.com/problems/valid-anagram/
 * 
 * 
 */ 
// Date: Sun May  3 15:42:05 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(max(s.count, t.count))
    ///     - Space: O(26)
    ///
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var count: [String : Int] = [:]
        for c in s {
            count[String(c)] = 1 + count[String(c), default: 0]
        }
        
        for c in t {
            count[String(c)] = count[String(c), default: 0] - 1
            if count[String(c)]! < 0 {
                return false
            }
        }
        return true
    }
}
