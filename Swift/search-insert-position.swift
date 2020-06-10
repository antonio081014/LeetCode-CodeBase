/**
 * https://leetcode.com/problems/search-insert-position/
 * 
 * 
 */ 
// Date: Wed Jun 10 15:08:02 PDT 2020
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        // guard let last = nums.last else { return 0 }
        // if last < target { return nums.count }
        var left = 0
        var right = nums.count
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
