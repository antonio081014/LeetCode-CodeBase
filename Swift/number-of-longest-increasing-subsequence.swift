/**
 * https://leetcode.com/problems/number-of-longest-increasing-subsequence/
 * 
 * 
 */ 
// Date: Fri Oct 30 11:07:47 PDT 2020
class Solution {
    /// maxCount: indicate the max length ending at index.
    /// maxCount[index] = 1 + max{ maxCount[end], 0 <= end < index }
    ///     ways[index]: indicate the unique diff ways to get index with max length.
    /// - Complexity: 
    ///     - Time: O(n^2), n is nums.count
    ///     - Space: O(n), to store the max length ending at `index`, and diff ways to get there with max length.
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var maxCount = Array(repeating: 1, count: nums.count)
        var ways = Array(repeating: 1, count: nums.count)
        ways[0] = 1
        var maxLen = maxCount[0]
        var result = ways[0]
        for index in stride(from: 1, to: nums.count, by: 1) {
            for end in stride(from: index - 1, through: 0, by: -1) {
                if nums[end] < nums[index] {
                    if 1 + maxCount[end] > maxCount[index] {
                        maxCount[index] =  1 + maxCount[end]
                        ways[index] = ways[end]
                    } else if 1 + maxCount[end] == maxCount[index] {
                        ways[index] += ways[end]
                    }                    
                } 
            }
            if maxLen == maxCount[index] {
                result += ways[index]
            } else if maxLen < maxCount[index] {
                result = ways[index]
                maxLen = maxCount[index]
            }
        }
        return result
    }
}