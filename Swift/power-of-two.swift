/**
 * https://leetcode.com/problems/power-of-two/
 * 
 * 
 */ 
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var n = n
        while n > 1 {
            if n % 2 != 0 { return false }
            n /= 2
        }
        return n == 1
    }
}
