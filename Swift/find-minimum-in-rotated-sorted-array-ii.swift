/**
 * Problem Link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
 *
 *
 */

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        for i in 1..<nums.count {
            if nums[i-1] > nums[i] {
                return nums[i]
            }
        }
        return nums[0]
    }
}
/**
 * https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
 * 
 * 
 */ 
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            while left < right, nums[left] == nums[left + 1] { left += 1 }
            while left < right, nums[right] == nums[right - 1] { right -= 1 }
            if left == right { return nums[left] }
            let mid = left + (right - left) / 2
            if nums[mid] >= nums[left] && nums[mid] >= nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return nums[left]
    }
}
