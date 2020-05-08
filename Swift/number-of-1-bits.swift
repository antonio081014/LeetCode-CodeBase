/**
 * https://leetcode.com/problems/number-of-1-bits/
 * 
 * 
 */ 
// Date: Fri May  8 13:48:26 PDT 2020
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            count += n % 2 == 0 ? 0 : 1
            n /= 2
        }
        return count
    }
}
/**
 * https://leetcode.com/problems/number-of-1-bits/
 * 
 * 
 */ 
// Date: Fri May  8 13:53:06 PDT 2020
class Solution {
    ///
    ///n the binary representation, the least significant 1-bit in n always corresponds to a 0-bit in  n−1. Therefore, anding the two numbers n and n−1 always flips the least significant 1-bit in n to 0, and keeps all other bits the same.
    ///
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            count += 1
            n &= (n - 1)
        }
        return count
    }
}
