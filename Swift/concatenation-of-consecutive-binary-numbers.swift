/**
 * https://leetcode.com/problems/concatenation-of-consecutive-binary-numbers/
 * 
 * 
 */ 
// Date: Wed Jan 27 14:05:46 PST 2021
class Solution {
    // f(n) = f(n-1) * 2^(n_binary_length) + n
    func concatenatedBinary(_ n: Int) -> Int {
        let d = 1_000_000_007
        var x = 1
        for i in stride(from: 2, through: n, by: 1) {
            x = ((x << (i.bitWidth - i.leadingZeroBitCount)) + i) % d
        }
        return x
    }
}