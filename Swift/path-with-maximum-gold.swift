/**
 * https://leetcode.com/problems/path-with-maximum-gold/
 * 
 * 
 */ 
// Date: Thu Jun 18 11:33:18 PDT 2020
class Solution {
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        var maxSum = 0
        let n = grid.count
        guard let m = grid.first?.count else { return maxSum }
        let dx = [1, 0, -1, 0]
        let dy = [0, 1, 0, -1]
        
        func dig(_ x: Int, _ y: Int, _ sum: Int, _ visited: inout [[Bool]]) {
            maxSum = max(sum, maxSum)
            for index in 0 ..< dx.count {
                let xx = x + dx[index]
                let yy = y + dy[index]
                if xx >= 0, xx < n, yy >= 0, yy < m, grid[xx][yy] > 0, visited[xx][yy] == false {
                    visited[xx][yy] = true
                    dig(xx, yy, sum + grid[xx][yy], &visited)
                    visited[xx][yy] = false
                }
            }
        }
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] == 0 { continue }
                var visited = Array(repeating: Array(repeating: false, count: m), count: n)
                visited[x][y] = true
                dig(x, y, grid[x][y], &visited)
            }
        }
        return maxSum
    }
}
