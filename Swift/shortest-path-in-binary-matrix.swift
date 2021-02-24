/**
 * https://leetcode.com/problems/shortest-path-in-binary-matrix/
 * 
 * 
 */ 
// Date: Tue Feb 23 22:03:16 PST 2021
class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        var grid = grid
        let n = grid.count
        guard let m = grid.first?.count else { return -1 }
        if grid[0][0] != 0 { return -1 }
        var queue = [(0, 0)]
        grid[0][0] = 1
        let dx = [0, 0, 1, 1, 1, -1, -1, -1]
        let dy = [1, -1, 1, -1, 0, -1, 1, 0]
        var steps = 0
        while queue.isEmpty == false {
            var size = queue.count
            steps += 1
            while size > 0 {
                let (x, y) = queue.removeFirst()
                if x == n - 1, y == m - 1 { return steps }
                size -= 1
                for index in 0 ..< dx.count {
                    let xx = x + dx[index]
                    let yy = y + dy[index]
                    if xx >= 0, xx < n, yy >= 0, yy < m, grid[xx][yy] == 0 {
                        grid[xx][yy] = 1
                        queue.append((xx, yy))
                    }
                }
            }
        }
        return -1
    }
}