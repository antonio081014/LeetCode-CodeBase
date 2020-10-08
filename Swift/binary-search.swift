/**
 * https://leetcode.com/problems/binary-search/
 * 
 * 
 */ 
// Date: Thu Oct  8 08:54:13 PDT 2020
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target { return mid }
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}