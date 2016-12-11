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
