/**
 * https://leetcode.com/problems/partitioning-into-minimum-number-of-deci-binary-numbers/
 * 
 * 
 */ 
// Date: Wed May 26 08:29:45 PDT 2021
class Solution {
    func minPartitions(_ n: String) -> Int {
        var result = 0
        for c in n {
            if let val = Int(String(c)) {
                result = max(val, result)
            }
        }
        return result
    }
}