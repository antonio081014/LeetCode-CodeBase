/**
 * https://leetcode.com/problems/set-matrix-zeroes/
 * 
 * 
 */ 
// Date: Fri Aug 13 09:08:58 PDT 2021
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let n = matrix.count
        guard let m = matrix.first?.count else { return }
        var row = Set<Int>()
        var col = Set<Int>()
        for x in 0 ..< n {
            for y in 0 ..< m {
                if matrix[x][y] == 0 {
                    row.insert(x)
                    col.insert(y)
                }
            }
        }
        for x in row {
            for y in 0 ..< m {
                matrix[x][y] = 0
            }   
        }
        for y in col {
            for x in 0 ..< n {
                matrix[x][y] = 0
            }
        }
    }
}