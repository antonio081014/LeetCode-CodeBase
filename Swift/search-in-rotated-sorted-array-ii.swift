/**
 * https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
 * 
 * 
 */ 
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1
        while left < right {
            while left < right, nums[left] == nums[left + 1] { left += 1 }
            while left < right, nums[right] == nums[right - 1] { right -= 1 }
            let mid = left + (right - left) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        // Found the smallest element, but might not be the first one.
        // So, go all the way left, to find the very first one.
        while left > 0, nums[left] == nums[left - 1] { left -= 1 }
        let offset = left
        left = 0
        right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let convertedMid = (offset + mid) % nums.count
            if nums[convertedMid] == target {
                return true
            } else if nums[convertedMid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return false
    }
}
