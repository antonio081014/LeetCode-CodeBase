/**
 * https://leetcode.com/problems/number-of-islands/
 * 
 * 
 */ 
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        var count = 0
        var grid = grid
        for x in 0 ..< grid.count {
            for y in 0 ..< grid.first!.count {
                if grid[x][y] == Character("1") {
                    count += 1
                    dfs(&grid, (x, y))
                }
            }
        }
        return count
    }
    
    fileprivate func dfs(_ grid: inout [[Character]], _ current: (Int, Int)) {
        grid[current.0][current.1] = Character("0")
        let dx = [0, -1, 0, 1]
        let dy = [1, 0, -1, 0]
        for index in 0 ..< dx.count {
            let xx = current.0 + dx[index]
            let yy = current.1 + dy[index]
            if xx >= 0, xx < grid.count, yy >= 0, yy < grid.first?.count ?? 0, grid[xx][yy] == Character("1") {
                dfs(&grid, (xx, yy))
            }
        }
    }
}
