/**
 * https://leetcode.com/problems/max-area-of-island/
 * 
 * 
 */ 
// Date: Tue Jun  1 15:06:06 PDT 2021

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        
        var visitGrid = grid
        let dx = [1, 0, -1, 0]
        let dy = [0, 1, 0, -1]
        
        func dfs(_ x: Int, _ y: Int) -> Int {
            guard visitGrid[x][y] == 1 else { return 0 }
            var count = 1
            visitGrid[x][y] = 0
            for index in 0 ..< 4 {
                let xx = x + dx[index]
                let yy = y + dy[index]
                if xx >= 0, xx < n, yy >= 0, yy < m {
                    count += dfs(xx, yy)
                }
            }
            return count
        }
        
        var result = 0
        for x in 0 ..< n {
            for y in 0 ..< m {
                result = max(result, dfs(x, y))
            }
        }
        
        return result
    }
}