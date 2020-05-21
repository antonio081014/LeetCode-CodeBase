/**
 * https://leetcode.com/problems/count-square-submatrices-with-all-ones/
 * 
 * 
 */ 
// Date: Thu May 21 11:23:48 PDT 2020
class Solution {
    /// Dynamic Programming
    /// mark[x][y] indicates the largest size of possible square whose bottom right corner is at (x, y)
    /// This `size` is also the number of possible squares, since a square, whose bottom right corner is at (x, y), could have length 1, 2, .., `size`.
    /// - Complexity:
    ///     - Time: O(n*m), m and n are the sizes of matrix.
    ///     - Space: O(n*m), m and n are the sizes of matrix.
    ///
    func countSquares(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        guard let m = matrix.first?.count else { return 0 }
        var result = 0
        var mark = Array(repeating: Array(repeating: 0, count: m), count: n)
        for x in 0 ..< n {
            for y in 0 ..< m {
                if matrix[x][y] == 1 {
                    var size = Int.max
                    size = min(size, x > 0 ? mark[x - 1][y] : 0)
                    size = min(size, y > 0 ? mark[x][y - 1] : 0)
                    size = min(size, x > 0 && y > 0 ? mark[x - 1][y - 1] : 0)
                    mark[x][y] = 1 + size
                }
                result += mark[x][y]
            }
        }
        return result
    }
}
