/**
 * https://leetcode.com/problems/climbing-stairs/
 * 
 * 
 */ 
// Date: Thu May  7 09:48:06 PDT 2020
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var zero = 1
        var one = 1
        var step = 2
        while step <= n {
            let tmp = zero + one
            zero = one
            one = tmp
            step += 1
        }
        return one
    }
}
/**
 * https://leetcode.com/problems/climbing-stairs/
 * 
 * 
 */ 
// Date: Fri Jul 31 09:38:09 PDT 2020
class Solution {
    /// Recursive solution with memorization to reduce duplicate calculations.
    /// - Complexity:
    ///     - Time: O(n), basically calculate every value smaller than or equal to n.
    ///     - Space: O(n), use a dictionary to store the calcuated value.
    ///
    var dict: [Int : Int] = [:]
    func climbStairs(_ n: Int) -> Int {
        if let value = dict[n] { return value }
        if n == 1 {
            dict[n] = 1
            return 1
        }
        if n == 0 {
            dict[n] = 1
            return 1
        }
        let v = climbStairs(n - 1) + climbStairs(n - 2)
        dict[n] = v
        return v
    }
}

class Solution {
    /// Iterative way to calculate with DP.
    /// Uses ways to store the calculated value.
    /// - Complexity:
    ///     - Time: O(n), try to calculate 1 to n values.
    ///     - Space: O(n), try to store the calculated value for 0 to n.
    ///
    func climbStairs(_ n: Int) -> Int {
        var ways = [1]
        for x in 1 ... n {
            var sum = 0
            if x >= 1 {
                sum += ways[x - 1]
            }
            if x >= 2 {
                sum += ways[x - 2]
            }
            ways.append(sum)
        }
        return ways[n]
    }
}
/**
 * https://leetcode.com/problems/climbing-stairs/
 * 
 * 
 */ 
// Date: Mon Oct  4 19:13:45 PDT 2021
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var ways0 = 0
        var ways1 = 1
        for x in 1 ... n {
            var sum = 0
            if x >= 1 {
                sum += ways1
            }
            if x >= 2 {
                sum += ways0
            }
            ways0 = ways1
            ways1 = sum
        }
        return ways1
    }
}