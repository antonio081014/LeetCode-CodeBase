/**
 * https://leetcode.com/problems/move-zeroes/
 * 
 * 
 */ 
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var start = 0
        for index in 0..<nums.count {
            if nums[index] != 0 {
                let tmp = nums[start]
                nums[start] = nums[index]
                nums[index] = tmp
                start += 1
            }
        }
    }
    
    // This solution didn't pass.
    // But I think it's fine, while using less operations, if exchange could be counted as 1.
    // O(N)
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        while left < right {
            if nums[left] == 0 {
                let tmp = nums[right]
                nums[right] = nums[left]
                nums[left] = tmp
                right -= 1
            } else {
                left += 1
            }
        }
    }
}
