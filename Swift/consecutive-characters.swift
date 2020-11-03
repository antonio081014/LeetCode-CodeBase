/**
 * https://leetcode.com/problems/consecutive-characters/
 * 
 * 
 */ 
// Date: Tue Nov  3 09:28:39 PST 2020
class Solution {
    func maxPower(_ s: String) -> Int {
        var lastCharacter: Character? = nil
        var count = 0
        var result = 1
        for c in s {
            if let last = lastCharacter {
                if last == c {
                    count += 1
                    result = max(result, count)
                    continue
                }
            }
            lastCharacter = c
            count = 1
        }
        return result
    }
}