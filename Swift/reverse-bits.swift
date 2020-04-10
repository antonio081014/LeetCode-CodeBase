/**
 * https://leetcode.com/problems/reverse-bits/
 * 
 * 
 */ 
class Solution {
    /// n is 32 bit integer.
    /// Thus,
    /// - Complexity: O(32) = O(1)
    ///
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var sum = 0
        var count = 32
        while n > 0 || count > 0 {
            if n > 0 {
                sum = (sum << 1) + n % 2
                n /= 2
            } else {
                sum = sum << 1
            }
            count -= 1
        }
        return sum
    }
}
