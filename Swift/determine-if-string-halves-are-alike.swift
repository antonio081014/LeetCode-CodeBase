/**
 * https://leetcode.com/problems/determine-if-string-halves-are-alike/
 * 
 * 
 */ 
// Date: Wed Apr  7 09:22:32 PDT 2021
class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let n = s.count
        var count = 0
        for (index, c) in s.lowercased().enumerated() {
            if "aeiou".contains(c) {
                count += index < n / 2 ? 1 : -1
            }
        }
        return count == 0
    }
}