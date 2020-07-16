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
/**
 * https://leetcode.com/problems/powx-n/
 * 
 * 
 */ 
// Date: Thu Jul 16 09:08:28 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(log n)
    ///     - Space: O(log n), it's the height of stack calls.
    ///
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n < 0 { return myPow(1.0 / x, -n) }
        if n == 0 { return 1 }
        if n == 1 { return x }
        let p = myPow(x, n / 2)
        if n % 2 == 0 {
            return p * p
        } else {
            return x * p * p
        }
    }
}
