/**
 * https://leetcode.com/problems/triangle/
 * 
 * 
 */ 
// Date: Sat Sep 12 16:03:03 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n^2)
    ///     - Space: O(n^2)
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var sum = triangle
        var minSum = Int.max
        for row in 0 ..< n {
            for col in 0 ... row {
                var left = Int.max
                var right = Int.max
                if row > 0 {
                    if col != row {
                        right = sum[row - 1][col]
                    }
                    if col > 0 {
                        left = sum[row - 1][col - 1]
                    }
                } else {
                    left = 0
                    right = 0
                }
                // print("\(row) : \(col) - \(left) - \(right)")
                sum[row][col] = triangle[row][col] + min(left, right)
                if row == n - 1 {
                    minSum = min(minSum, sum[row][col])
                }
            }
        }
        // print(sum)
        return minSum
    }
}/**
 * https://leetcode.com/problems/triangle/
 * 
 * 
 */ 
// Date: Sat Sep 12 16:08:06 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n^2)
    ///     - Space: O(2n)
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var sum = Array(repeating: Array(repeating: 0, count: n), count: 2)
        var minSum = Int.max
        for row in 0 ..< n {
            for col in 0 ... row {
                var left = Int.max
                var right = Int.max
                if row > 0 {
                    if col != row {
                        right = sum[(row + 1) % 2][col]
                    }
                    if col > 0 {
                        left = sum[(row + 1) % 2][col - 1]
                    }
                } else {
                    left = 0
                    right = 0
                }
                // print("\(row) : \(col) - \(left) - \(right)")
                sum[row % 2][col] = triangle[row][col] + min(left, right)
                if row == n - 1 {
                    minSum = min(minSum, sum[row % 2][col])
                }
            }
        }
        // print(sum)
        return minSum
    }
}