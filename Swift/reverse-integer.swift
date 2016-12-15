/**
 * Problem Link: https://leetcode.com/problems/reverse-integer/
 *
 *
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        let neg = x < 0
        let n = convert(abs(x))
        return (neg ? -1 : 1) * n
    }
    
    private func convert(_ nn: Int) -> Int {
        var n = nn
        var res = 0
        while n > 0 {
            // We are reversing a signed integer, so here we only have 31 bits for valid number, 1 bit for the sign.
            if (res * 10 + n % 10) > (1<<31-1) {
                return 0
            }
            res = res * 10 + n % 10
            n /= 10
        }
        return res
    }
}
