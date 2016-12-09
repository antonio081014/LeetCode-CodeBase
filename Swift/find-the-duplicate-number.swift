/**
 * Problem Link: https://leetcode.com/problems/find-the-duplicate-number/
 *
 * Binary Search.
 */

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var left = 1
        var right = nums.count
        while left < right {
            let mid = (left + right) / 2
            var count = 0
            for n in nums {
                if n <= mid {
                    count += 1
                }
            }
            if count > mid {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return right
    }
}
