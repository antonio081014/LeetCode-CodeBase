/**
 * https://leetcode.com/problems/missing-number/
 * 
 * 
 */ 
// Date: Fri May  8 14:05:52 PDT 2020
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        var total = n * (n + 1) / 2
        for x in nums {
            total -= x
        }
        return total
    }
}
