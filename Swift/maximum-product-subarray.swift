/**
 * https://leetcode.com/problems/maximum-product-subarray/
 * 
 * 
 */ 
// Date: Sun Sep 20 12:03:17 PDT 2020
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var prevMax = nums[0]
        var prevMin = nums[0]
        var result = Int.min
        for index in stride(from: 1, to: nums.count, by: 1) {
            prevMax = max(nums[index], nums[index] * max(prevMax, prevMin))
            prevMin = min(nums[index], nums[index] * min(prevMax, prevMin))
            result = max(result, prevMax)
        }
        return result
    }
}