/**
 * https://leetcode.com/problems/arranging-coins/
 * 
 * 
 */ 
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        if n == 1 {return 1}
        var left = 1
        var right = n
        while left < right {
            let mid = (left + right) / 2
            if mid * mid + mid <= 2 * n {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left - 1
    }
}
/**
 * https://leetcode.com/problems/arranging-coins/
 * 
 * 
 */ 
// Date: Wed Jul  1 09:34:58 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(logn), using a binary search, nothing else could be expected here.
    ///     - Space: O(1), since we only have left, right.
    ///
    func arrangeCoins(_ n: Int) -> Int {
        var left = 1
        var right = n + 1
        while left < right {
            let mid = left + (right - left) / 2
            if mid * (mid + 1) <= n * 2 {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left - 1
    }
}
/**
 * https://leetcode.com/problems/arranging-coins/
 * 
 * 
 */ 
// Date: Wed Jul  1 09:39:52 PDT 2020
class Solution {
    /// Mathmatical way to solve this problem
    /// k*(k+1) / 2 <= n
    /// k^2 + k <= 2n
    /// (k+1/2)^2 <= 2n + 1/4
    /// k <= sqrt(2n + 1/4) - 1/2
    /// 
    /// - Complexity:
    ///     - Time: O(1)
    ///     - Space: O(1)
    ///
    func arrangeCoins(_ n: Int) -> Int {
        return Int(sqrt(Double(n) * 2.0 + 0.25) - 0.5)
    }
}
