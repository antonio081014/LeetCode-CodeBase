/**
 * https://leetcode.com/problems/patching-array/
 * 
 * 
 */ 
// Date: Sun Aug 29 13:23:29 PDT 2021
class Solution {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var missingNumber = 1
        var count = 0
        var index = 0
        while missingNumber <= n {
            if index < nums.count, nums[index] <= missingNumber {
                // Extend the covered area.
                missingNumber += nums[index]
                index += 1
            } else {
                // Add missing number
                count += 1
                missingNumber += missingNumber
            }
        }
        return count
    }
}