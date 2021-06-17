/**
 * https://leetcode.com/problems/number-of-subarrays-with-bounded-maximum/
 * 
 * 
 */ 
// Date: Thu Jun 17 11:20:35 PDT 2021
class Solution {
    func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        var result = 0
        var dp = 0
        var prev = -1
        for index in 0 ..< nums.count {
            if nums[index] < left, index > 0 {
                result += dp
            }
            if nums[index] > right {
                dp = 0
                prev = index
            }
            if nums[index] >= left, nums[index] <= right {
                dp = index - prev
                result += dp
            }
        }
        return result
    }
}