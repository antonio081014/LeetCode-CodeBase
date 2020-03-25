/**
 * https://leetcode.com/problems/unique-paths-ii/
 * 
 * 
 */ 
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let n = obstacleGrid.count
        guard let m = obstacleGrid.first?.count else { return 0 }
        var mark = Array(repeating: Array(repeating: 0, count: m), count: n)
        mark[0][0] = 1 - obstacleGrid[0][0]
        for x in 0 ..< n {
            for y in 0 ..< m {
                if obstacleGrid[x][y] == 1 { continue }
                if x > 0 {
                    mark[x][y] += mark[x - 1][y] 
                }
                if y > 0 {
                    mark[x][y] += mark[x][y - 1]
                }
            }
        }
        return mark[n - 1][m - 1]
    }
}