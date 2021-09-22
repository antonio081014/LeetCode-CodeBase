/**
 * https://leetcode.com/problems/max-consecutive-ones/
 * 
 * 
 */ 
// Date: Tue Sep 21 19:50:55 PDT 2021
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var result = 0
        var count = 0
        for n in nums {
            if n == 0 { count = 0 }
            else { count += 1 }
            result = max(count, result)
        }
        return result
    }
}