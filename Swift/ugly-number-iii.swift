/**
 * https://leetcode.com/problems/ugly-number-iii/
 * 
 * 
 */ 
class Solution {
    /// Calculate the Greatest Common Divisor.
    fileprivate func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
    
    /// Using binary search find the very first number (x) between 1 and Int.max, which satisfied
    ///     1. divisable by a, b, or c
    ///     2. including itself, has n number satisfy the above (1st) criteria.
    /// When couting total number, we are trying to find A ∪ B ∪ C - A ∩ B - A ∩ C - B ∩ C + A ∩ B ∩ C.
    /// Where,
    ///     - A: indicates the number of integers between 1 and x, inclusive, divisable by a
    ///     - B: indicates the number of integers between 1 and x, inclusive, divisable by b
    ///     - C: indicates the number of integers between 1 and x, inclusive, divisable by c
    ///     So, there might be numbers divisable by two of these integer, or divisable by all three integers.
    ///     
    /// - Complexity: O(logn), where n is Int.max
    ///
    func nthUglyNumber(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
        let ab = a * b / gcd(a, b)
        let bc = b * c / gcd(b, c)
        let ac = a * c / gcd(a, c)
        let abc = a * bc / gcd(a, bc)
        var left = 1
        var right = Int.max
        while left < right {
            let mid = left + (right - left) / 2
            let count = mid / a + mid / b + mid / c - mid / ab - mid / bc - mid / ac + mid / abc
            if count < n {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
