/**
 * https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/
 * 
 * 
 */ 
// Date: Fri Apr 16 14:15:56 PDT 2021
class Solution {
    func removeDuplicates(_ S: String) -> String {
        var result = ""
        for c in S {
            if let last = result.last, last == c {
                result.removeLast()
            } else {
                result.append(c)
            }
        }
        return result
    }
}