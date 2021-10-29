/**
 * https://leetcode.com/problems/v/
 * 
 * 
 */ 
// Date: Thu Oct 28 23:09:51 PDT 2021
class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var steps = 0
        let n = grid.count
        guard let m = grid.first?.count else { return steps }
        var grid = grid
        var queue = [(x: Int, y: Int)]()
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] == 2 {
                    queue.append((x, y))
                }
            }
        }
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        while queue.isEmpty == false {
            var count = queue.count
            steps += 1
            while count > 0 {
                let (x, y) = queue.removeFirst()
                count -= 1
                for index in 0 ..< 4 {
                    let xx = x + dx[index]
                    let yy = y + dy[index]
                    if xx >= 0, yy >= 0, xx < n, yy < m, grid[xx][yy] == 1 {
                        grid[xx][yy] = 2
                        queue.append((xx, yy))
                    }
                }
            }
        }
        
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] == 1 { return -1 }
            }
        }
        
        return max(0, steps - 1)
    }
}