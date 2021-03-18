/**
 * https://leetcode.com/problems/wiggle-subsequence/
 * 
 * 
 */ 
// Date: Thu Mar 18 15:30:35 PDT 2021
class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        var up = Array(repeating: 1, count: nums.count)
        var down = Array(repeating: 1, count: nums.count)
        var result = 1
        for index in stride(from: 1, to: nums.count, by: 1) {
            for last in stride(from: 0, to: index, by: 1) {
                if nums[index] > nums[last] {
                    up[index] = max(up[index], 1 + down[last])
                } else if nums[index] < nums[last] {
                    down[index] = max(down[index], 1 + up[last])
                }
            }
            result = max(result, max(down[index], up[index]))
        }
        return result
    }
}