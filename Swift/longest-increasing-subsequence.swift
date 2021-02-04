/**
 * https://leetcode.com/problems/longest-increasing-subsequence/
 * 
 * 
 */ 
// Date: Thu Feb  4 15:44:24 PST 2021
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count

        var dp = Array(repeating: 0, count: n)
        var result = 0
        for end in 0 ..< n {
            dp[end] = 1
            for last in stride(from: end - 1, through: 0, by: -1) {
                if nums[end] > nums[last] {
                    dp[end] = max(dp[end], dp[last] + 1)
                }
            }
            result = max(result, dp[end])
        }
        return result
    }
}