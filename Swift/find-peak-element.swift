/**
 * https://leetcode.com/problems/find-peak-element/
 * 
 * 
 */ 
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let nums = [Int.min] + nums + [Int.min]
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if mid > 0, nums[mid] > nums[mid - 1], mid + 1 < nums.count, nums[mid] > nums[mid + 1] {
                return mid - 1
            } else if mid > 0, nums[mid] < nums[mid - 1] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}
