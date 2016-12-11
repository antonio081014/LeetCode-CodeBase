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
