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