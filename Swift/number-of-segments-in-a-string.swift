/**
 * https://leetcode.com/problems/number-of-segments-in-a-string/
 * 
 * 
 */ 
class Solution {
    func countSegments(_ s: String) -> Int {
        var count = 0
        var flag = false
        for c in s.lowercased().characters {
            if " " != String(c) {
                flag = true
            } else {
                if flag { count += 1 }
                flag = false
            }
        }
        if flag { count += 1 }
        return count
    }
}
