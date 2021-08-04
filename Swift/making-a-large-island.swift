/**
 * https://leetcode.com/problems/making-a-large-island/
 * 
 * 
 */ 
// Date: Wed Aug  4 14:11:42 PDT 2021
class Solution {
    func largestIsland(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var colorMap = [Int : Int]()
        var color = 2
        var grid = grid
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] == 1 {
                    colorMap[color] = dfs(x, y, &grid, color)
                    color += 1
                }
            }
        }
        // print(grid)
        var result = colorMap[2, default: 0]
        let dt = [0, 1, 0, -1, 0]
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] == 0 {
                    var tempResult = 1
                    var visited: Set<Int> = []
                    for index in 0 ..< 4 {
                        let xx = x + dt[index]
                        let yy = y + dt[index + 1]
                        if xx >= 0, xx < n, yy >= 0, yy < m, let count = colorMap[grid[xx][yy]], visited.contains(grid[xx][yy]) == false {
                            tempResult += count
                            visited.insert(grid[xx][yy])
                        }
                    }
                    result = max(result, tempResult)
                }
            }
        }
        return result
    }

    private func dfs(_ x: Int, _ y: Int, _ grid: inout [[Int]], _ color: Int) -> Int {
        guard grid[x][y] == 1 else { return 0 }
        var result = 1
        grid[x][y] = color
        let dt = [0, 1, 0, -1, 0]
        for index in 0 ..< 4 {
            let xx = x + dt[index]
            let yy = y + dt[index + 1]
            if xx >= 0, xx < grid.count, yy >= 0, yy < (grid.first?.count ?? 0), grid[xx][yy] == 1 {
                result += dfs(xx, yy, &grid, color)
            }
        }
        return result
    }
}


