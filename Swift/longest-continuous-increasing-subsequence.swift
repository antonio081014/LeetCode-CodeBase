/**
 * https://leetcode.com/problems/longest-continuous-increasing-subsequence/
 * 
 * 
 */ 
// Date: Tue Nov  3 09:32:56 PST 2020
class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var count = 1
        var result = 1
        for index in stride(from: 1, to: nums.count, by: 1) {
            if nums[index] > nums[index - 1] {
                count += 1
            } else {
                count = 1
            }
            result = max(result, count)
        }
        return result
    }
}