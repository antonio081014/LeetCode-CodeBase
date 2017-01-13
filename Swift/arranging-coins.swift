/**
 * https://leetcode.com/problems/arranging-coins/
 * 
 * 
 */ 
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        if n == 1 {return 1}
        var left = 1
        var right = n
        while left < right {
            let mid = (left + right) / 2
            if mid * mid + mid <= 2 * n {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left - 1
    }
}
