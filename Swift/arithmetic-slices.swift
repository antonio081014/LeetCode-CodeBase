/**
 * https://leetcode.com/problems/arithmetic-slices/
 * 
 * 
 */ 
class Solution {
    // Dynamic Programming solution.
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        let n = A.count
        guard n >= 3 else { return 0 }
        var mark = Array(repeating: 0, count: n)
        var total = 0
        for i in 2..<n {
            if A[i]-A[i-1] == A[i-1]-A[i-2] {
                mark[i] = mark[i-1] + 1
            }
            total += mark[i]
        }
        return total
    }
    // Simplified DP solution.
    func numberOfArithmeticSlices2(_ A: [Int]) -> Int {
        let n = A.count
        guard n >= 3 else { return 0 }
        var c = 0
        var s = 0
        for i in 2..<n {
            if A[i]-A[i-1] == A[i-1]-A[i-2] {
                c += 1
                s += c
            } else {
                c = 0
            }
        }
        return s
    }
}
/**
 * https://leetcode.com/problems/arithmetic-slices/
 * 
 * 
 */ 
// Date: Thu Feb 18 11:38:21 PST 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(n^2)
    ///     - Space: O(1)
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        guard A.count > 2 else { return 0 }
        var result = 0
        for start in 0 ..< A.count - 2 {
            let diff = A[start + 1] - A[start]
            for end in start + 2 ..< A.count {
                if A[end] - A[end - 1] == diff {
                    result += 1
                } else {
                    break
                }
            }
        }
        return result
    }
}/**
 * https://leetcode.com/problems/arithmetic-slices/
 * 
 * 
 */ 
// Date: Thu Feb 18 11:54:11 PST 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(n)
    ///     - Space: O(n)
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        var dp = Array(repeating: 0, count: A.count)
        var result = 0
        for end in stride(from: 2, to: A.count, by: 1) {
            if A[end] - A[end - 1] == A[end - 1] - A[end - 2] {
                dp[end] = 1 + dp[end - 1]
                result += dp[end]
            }
        }
        return result
    }
}/**
 * https://leetcode.com/problems/arithmetic-slices/
 * 
 * 
 */ 
// Date: Thu Feb 18 11:55:37 PST 2021
class Solution {
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        var dp = 0
        var result = 0
        for end in stride(from: 2, to: A.count, by: 1) {
            if A[end] - A[end - 1] == A[end - 1] - A[end - 2] {
                dp += 1
                result += dp
            } else {
                dp = 0
            }
        }
        return result
    }
}