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
/**
 * https://leetcode.com/problems/factorial-trailing-zeroes/
 * 
 * 
 */ 
// Date: Fri Jul 10 16:12:12 PDT 2020
class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            n /= 5
            count += n
        }
        return count
    }
}
