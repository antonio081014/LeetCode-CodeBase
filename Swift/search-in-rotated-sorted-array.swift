/**
 * https://leetcode.com/problems/search-in-rotated-sorted-array/
 * 
 * 
 */ 

class Solution {
    ///
    /// - Complexity: O(logn)
    ///
    func search(_ nums: [Int], _ target: Int) -> Int {
        /// 1. find the 0th index of number in nums.
        /// Using binary search to find the index of very first element, which should be the smallest element.
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        let offset = left
        print("Offset: \(offset)")
        
        /// 2. find the index of target.
        /// Using binary search to find target in sorted array.
        /// Trick here is to find the index with offset.
        left = 0
        right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let midWithOffset = (mid + offset) % nums.count
            if nums[midWithOffset] == target {
                return midWithOffset
            } else if nums[midWithOffset] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}
