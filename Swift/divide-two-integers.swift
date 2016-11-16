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
