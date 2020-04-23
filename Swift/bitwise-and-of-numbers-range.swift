/**
 * https://leetcode.com/problems/bitwise-and-of-numbers-range/
 * 
 * 
 */ 
// Date: Thu Apr 23 07:34:11 PDT 2020

/// The idea is very simple:
///
/// 1. last bit of (odd number & even number) is 0.
/// 2. when m != n, There is at least an odd number and an even number, so the last bit position result is 0.
/// 3. Move m and n rigth a position.
/// 
/// Keep doing step 1,2,3 until m equal to n, use a factor to record the iteration time.

class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        if m == 0 { return 0 }
        var m = m
        var n = n
        var bit = 0
        while m != n {
            m /= 2
            n /= 2
            bit += 1
        }
        return m << bit
    }
}
