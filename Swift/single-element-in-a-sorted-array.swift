/**
 * https://leetcode.com/problems/single-element-in-a-sorted-array/
 * 
 * 
 */ 
// Date: Tue May 12 09:46:59 PDT 2020
class Solution {
    /// Binary Search, map index from 0, 0, 1, 1, 2, 2, 3, 3 ... to 0, 1, 2, 3, ...
    /// So, at index mid, check on number at mid * 2 and mid * 2 + 1.
    /// Finally, left is the index where first unequal numbers mapped in the new array.
    ///
    /// - Complexity:
    ///     - Time: O(logn).
    ///     - Space: O(1)
    ///
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        var right = (nums.count) / 2
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid * 2] != nums[mid * 2 + 1] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return nums[left * 2]
    }
}
