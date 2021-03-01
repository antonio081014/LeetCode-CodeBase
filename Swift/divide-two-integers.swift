class Solution {
    func divide(dividend: Int, _ divisor: Int) -> Int {
        let neg = (dividend > 0) != (divisor > 0)
        var a = abs(dividend)
        var b = abs(divisor)
        var ret = 0
        while a >= b {
            var c = 1
            var base = b
            while a >= (base << 1) {
                base <<= 1
                c <<= 1
            }
            ret += c
            a -= base
        }
        return neg ? -ret : min(ret, 2147483647)
    }
}
/**
 * https://leetcode.com/problems/divide-two-integers/
 * 
 * 
 */ 
// Date: Mon Mar  1 15:43:00 PST 2021
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var result = 0
        let sign = (divisor > 0) != (dividend > 0)
        var sum = abs(dividend)
        while sum >= abs(divisor) {
            var offset = 0
            while (abs(divisor) << offset) <= sum {
                offset += 1
            }
            offset -= 1
            sum -= abs(divisor) << offset
            result += 1 << offset
        }
        return sign ? max(-result, -2147483648) : min(result, 2147483647)
    }
}