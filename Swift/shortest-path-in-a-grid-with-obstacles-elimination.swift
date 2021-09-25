/**
 * https://leetcode.com/problems/shortest-path-in-a-grid-with-obstacles-elimination/
 * 
 * 
 */ 
// Date: Sat Sep 25 08:41:22 PDT 2021
class Solution {
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let m = grid.count
        let n = grid[0].count
        var queue = [(0, 0, k)]
        var cost = Array(repeating: Array(repeating: Array(repeating: m * n + 1, count: k + 1), count: n), count: m)
        cost[0][0][k] = 0
        
        while queue.isEmpty == false {
            let (x, y, ob) = queue.removeFirst()
            if x == m - 1, y == n - 1 { return cost[x][y][ob] }
            let dt = [0, 1, 0, -1, 0]
            let c = cost[x][y][ob]
            for index in 0 ..< 4 {
                let xx = x + dt[index]
                let yy = y + dt[index + 1]
                if xx >= 0, xx < m, yy >= 0, yy < n {
                    if grid[xx][yy] == 0 {
                        if c + 1 < cost[xx][yy][ob] {
                            cost[xx][yy][ob] = c + 1
                            queue.append((xx, yy, ob))
                        }
                    } else {
                        if ob > 0, c + 1 < cost[xx][yy][ob - 1] {
                            cost[xx][yy][ob - 1] = c + 1
                            queue.append((xx, yy, ob - 1))
                        }
                    }
                }
            }
        }
        print(cost)
        return -1
    }
}