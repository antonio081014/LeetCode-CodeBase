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
            let mid = left + (right - left) / 2
            var count = 0
            // Count number of numbers equal or smaller than mid.
            for n in nums {
                if n <= mid {
                    count += 1
                }
            }
            /// Key:
            /// For mid, we would have mid numbers smaller or equal to mid.
            /// If there is x numbers qualifed, and x is larger than mid, we know the duplicate number is equal or smaller than mid.
            /// Otherwise, left = mid + 1.
            ///
            if count <= mid {
                left = mid + 1
            } else {
                right = mid
            }
        }
        // print("\(left) - \(right)")
        return left
    }
}
