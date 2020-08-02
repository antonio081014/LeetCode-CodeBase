/**
 * https://leetcode.com/problems/detect-capital/
 * 
 * 
 */ 
// Date: Sat Aug  1 23:49:02 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the length of string word.
    ///     - Space: O(1), constant space to store first and count, but if we cound w, then we have O(n) space.
    ///
    func detectCapitalUse(_ word: String) -> Bool {
        var first = false
        var count = 0
        let w = Array(word)
        let set = Set(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
        for index in 0 ..< w.count {
            if set.contains(w[index]) {
                count += 1
                if index == 0 {
                    first = true
                }
            }
        }
        if first {
            return count == 1 || count == w.count
        }
        if count == 0 { return true }
        return false
    }
}
