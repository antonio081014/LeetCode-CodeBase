/**
 * https://leetcode.com/problems/valid-perfect-square/
 * 
 * 
 */ 
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var left = 1
        var right = num
        while left <= right {
            let mid = left + (right - left) / 2
            if mid * mid == num {
                return true
            } else if mid * mid > num {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return false
    }
}
