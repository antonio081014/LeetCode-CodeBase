/**
 * https://leetcode.com/problems/minimum-value-to-get-positive-step-by-step-sum/
 * 
 * 
 */ 
// Date: Sat Nov 27 09:08:39 PST 2021
class Solution {
    func minStartValue(_ nums: [Int]) -> Int {
        var start = 0
        var sum = 0
        for n in nums {
            sum += n
            start = min(start, sum)
        }
        return -start + 1
    }
}