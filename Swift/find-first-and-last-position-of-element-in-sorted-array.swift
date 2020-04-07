/**
 * https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 * 
 * 
 */ 
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [searchFirst(nums, target), searchLast(nums, target)]
    }
    
    func searchFirst(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        while left < right {
            let mid = (left + right) / 2
            // Try to find the very first element >= target.
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return (left < nums.count && nums[left] == target) ? left : -1
    }
    
    func searchLast(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        while left < right {
            let mid = (left + right) / 2
            // Try to find the very first element > target
            if nums[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return (left - 1 >= 0 && nums[left - 1] == target) ? left - 1 : -1
    }
}
