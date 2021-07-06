/**
 * https://leetcode.com/problems/reshape-the-matrix/
 * 
 * 
 */ 
// Date: Mon Jul  5 22:06:10 PDT 2021
class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let n = mat.count
        guard let m = mat.first?.count, n * m == r * c else { return mat }
        var result = Array(repeating: Array(repeating: 0, count: c), count: r)
        var xx = 0
        var yy = 0
        for x in stride(from: 0, to: mat.count, by: 1) {
            for y in stride(from: 0, to: mat.first?.count ?? 0, by: 1) {
                result[xx][yy] = mat[x][y]
                yy += 1
                if yy == c {
                    xx += 1
                    yy = 0
                }
            }
        }
        return result
    }
}