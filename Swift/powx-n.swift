/**
 * https://leetcode.com/problems/powx-n/
 * 
 * 
 */ 
class Solution {
    /// Divide and Conquer
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        if n < 0 { return myPow(1.0 / x, -n) }
        if n == 1 { return x }
        if n % 2 == 0 {
            let pow = myPow(x, n / 2)
            return pow * pow
        } else {
            let pow = myPow(x, n / 2)
            return x * pow * pow
        }
    }
}
