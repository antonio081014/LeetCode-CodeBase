/**
 * https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/
 * 
 * 
 */ 
///
/// - Complexity:
///     - Time: O(n^2logk), n is the size of matrix, k is distance between smallest number and largest number.
///     - Space: O(1)
///
class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let n = matrix.count
        guard let m = matrix.first?.count else { return 0 }
        var left = matrix[0][0]
        var right = matrix[n - 1][m - 1]
        while left < right {
            let mid = left + (right - left) / 2
            var count = 0
            for x in 0 ..< n {
                if matrix[x][0] > mid { break }
                var y = m - 1
                while y >= 0, matrix[x][y] > mid { y -= 1 }
                count += y + 1
            }
            if count < k {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
