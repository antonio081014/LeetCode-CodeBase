/**
 * Problem Link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
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
 * https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
 * 
 * 
 */ 
class Solution {
    /// Use binary search.
    /// - Complexity: O(logN)
    ///
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            // if element at mid is larger than element at left and right,
            // in the rotated array, it's the peak between left and right,
            // highest peak might be on its right, so is the smallest element.
            // then, we will cut the left part out, peak inclusive.
            if nums[mid] >= nums[left] && nums[mid] >= nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return nums[left]
    }
}
