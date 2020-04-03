/**
 * https://leetcode.com/problems/sqrtx/
 * 
 * 
 */ 
class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 1 { return 1 }
        var left = 1
        var right = x
        while left < right {
            let mid = left + (right - left) / 2
            if mid * mid > x {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left - 1
    }
}