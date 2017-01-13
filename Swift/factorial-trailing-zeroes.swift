/**
 * https://leetcode.com/problems/factorial-trailing-zeroes/
 * 
 * 
 */ 
class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var base = 5
        var x = n
        var count = 0
        while x >= base {
            count += x / base
            base *= 5
        }
        return count
    }
}
