/**
 * https://leetcode.com/problems/maximum-sum-circular-subarray/
 * 
 * 
 */ 
// Date: Mon May 18 20:43:30 PDT 2020
///
/// Ref Link: https://leetcode.com/problems/maximum-sum-circular-subarray/discuss/178422/One-Pass
///
class Solution {
    func maxSubarraySumCircular(_ A: [Int]) -> Int {
        var total = 0
        var currentMax = 0
        var currentMin = 0
        var sumMax = A[0]
        var sumMin = A[0]
        
        for a in A {
            total += a
            currentMax = max(a, currentMax + a)
            sumMax = max(sumMax, currentMax)
            currentMin = min(a, currentMin + a)
            sumMin = min(sumMin, currentMin)
        }
        
        return sumMax > 0 ? max(sumMax, total - sumMin) : sumMax
    }
}
