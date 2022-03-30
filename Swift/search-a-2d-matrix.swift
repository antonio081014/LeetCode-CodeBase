/**
 * https://leetcode.com/problems/search-a-2d-matrix/
 * 
 * 
 */ 
// Date: Thu Oct 29 10:43:49 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n + m), n and m are the sizes of matrix.
    ///     - Space: O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard let last = matrix.last, last.count > 0 else { return false }
        var r = matrix.count - 1
        var c = 0
        while r >= 0, c < last.count {
            if matrix[r][c] == target { return true }
            if matrix[r][c] > target { r -= 1 }
            else { c += 1 }
        }
        return false
    }
}

class Solution {
    /// - Complexity:
    ///     - Time: O(logm + logn), n = matrix.count, m = matrix.first?.count ?? 0
    ///     - Space: O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let n = matrix.count
        guard let m = matrix.first?.count else { return false }
        
        var left = 0
        var right = n - 1
        var row = -1
        while left <= right {
            let mid = left + (right - left) / 2
            if matrix[mid][0] <= target, matrix[mid][m - 1] >= target {
                row = mid
                break
            } else if matrix[mid][0] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        if row < 0 { return false }
        left = 0
        right = m - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if matrix[row][mid] == target { return true }
            if matrix[row][mid] > target { right = mid - 1 }
            else {left = mid + 1 }
        }
        return false 
    }
}

class Solution {
    /// - Complexity:
    ///     - Time: O(log(m * n)), n = matrix.count, m = matrix.first?.count ?? 0
    ///     - Space: O(1)
    func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
        let n = matrix.count
        guard let m = matrix.first?.count else { return false }
        var left = 0
        var right = m * n - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let r = mid / m
            let c = mid % m
            if matrix[r][c] == target { return true }
            if matrix[r][c] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return false
    }
}
