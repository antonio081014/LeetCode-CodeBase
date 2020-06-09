/**
 * https://leetcode.com/problems/is-subsequence/
 * 
 * 
 */ 
// Date: Tue Jun  9 07:46:01 PDT 2020
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let s = Array(s)
        let t = Array(t)
        var index1 = 0
        var index2 = 0
        while index1 < s.count || index2 < t.count {
            if index1 < s.count && index2 < t.count {
                if s[index1] == t[index2] {
                    index1 += 1
                    index2 += 1
                } else {
                    index2 += 1
                }
            } else if index1 < s.count {
                return false
            } else {
                return true
            }
        }
        return true
    }
}
