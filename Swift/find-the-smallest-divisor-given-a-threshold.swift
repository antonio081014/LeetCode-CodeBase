/**
 * https://leetcode.com/problems/find-the-smallest-divisor-given-a-threshold/
 * 
 * 
 */ 
// Date: Fri Nov  6 09:41:05 PST 2020
class Solution {
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        var right = 1 + nums.reduce(0) { $0 + $1 }
        var left = 1
        while left < right {
            let mid = left + (right - left) / 2
            let sum = nums.reduce(0) { $0 + (( $1 + mid - 1) / mid) }
            if sum <= threshold {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}