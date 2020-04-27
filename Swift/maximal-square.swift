/**
 * Problem Link: https://leetcode.com/problems/maximal-square/
 *
 */

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var mark = [[Int]]()
        let n = matrix.count
        if n == 0 {
            return 0
        }
        var maxn = 0
        for i in 0..<n {
            var tmp = [Int]()
            for j in 0..<matrix[i].count {
                tmp.append(matrix[i][j]=="1" ? 1 : 0)
                maxn = max(maxn, tmp[j])
            }
            mark.append(tmp)
        }
        
        for i in 1..<n {
            for j in 1..<matrix[i].count {
                if matrix[i][j] == "1" {
                    var mint = mark[i-1][j-1]
                    mint = min(mint, mark[i-1][j])
                    mint = min(mint, mark[i][j-1])
                    mark[i][j] = max(mark[i][j], 1 + mint)
                    maxn = max(maxn, mark[i][j])
                }
            }
        }
        return maxn * maxn
    }
}
/**
 * https://leetcode.com/problems/maximal-square/
 * 
 * 
 */ 
// Date: Mon Apr 27 09:08:34 PDT 2020
class Solution {
    ///
    /// `square[x][y]` indicates the largest size of square whose right bottom is at (x, y).
    /// 
    /// - Complexity:
    ///     - Time: O(m*n), m and n are the width and height of matrix.
    ///     - Space: O(m*n), m and n are the width and height of matrix.
    ///
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let n = matrix.count
        guard let m = matrix.first?.count else { return 0 }
        var square = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        var maxCount = 0
        for x in 0 ..< n {
            for y in 0 ..< m {
                if x == 0 || y == 0 {
                    square[x][y] = matrix[x][y] == Character("1") ? 1 : 0
                } else {
                    if matrix[x][y] == Character("1") {
                        square[x][y] = 1 + min(square[x - 1][y - 1], min(square[x - 1][y], square[x][y - 1]))
                    }
                }
                maxCount = max(maxCount, square[x][y])
            }
        }
        // print("\(square)")
        return maxCount * maxCount
    }
}
