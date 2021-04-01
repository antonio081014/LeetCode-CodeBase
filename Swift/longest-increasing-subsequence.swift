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
}/**
 * https://leetcode.com/problems/longest-increasing-subsequence/
 * 
 * 
 */ 
// Date: Thu Apr  1 11:13:56 PDT 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(nlgn)
    ///     - Space: O(n)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var listOfLIS = Array(repeating: 0, count: n)
        var end = 0
        
        for n in nums {
            var left = 0
            var right = end
            while left < right {
                let mid = left + (right - left) / 2
                if listOfLIS[mid] < n {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            listOfLIS[left] = n
            if left == end {
                end += 1
            }
            // print("\(n) - \(listOfLIS)")
        }
        
        return end
    }
}