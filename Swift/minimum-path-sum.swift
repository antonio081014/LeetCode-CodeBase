/**
 * https://leetcode.com/problems/minimum-path-sum/
 * 
 * 
 */ 

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var mark = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        mark[0][0] = grid[0][0]
        for x in 0 ..< n {
            for y in 0 ..< m {
                if x > 0 {
                    mark[x][y] = min(mark[x - 1][y] + grid[x][y], mark[x][y])
                }
                if y > 0 {
                    mark[x][y] = min(mark[x][y - 1] + grid[x][y], mark[x][y])
                }
            }
        }
        return mark[n - 1][m - 1]
    }
}