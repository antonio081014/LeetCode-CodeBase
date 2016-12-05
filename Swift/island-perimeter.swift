/**
 * Problem Link: https://leetcode.com/problems/island-perimeter/
 *
 */

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var count = 0
        for x in 0..<grid.count {
            for y in 0..<grid[x].count {
                count += perimeter(at: x, and: y, grid)
            }
        }
        return count
    }
    
    private func perimeter(at x: Int, and y: Int, _ grid: [[Int]]) -> Int {
        var count = 0
        if grid[x][y] == 0 {
            return count
        }
        if x == 0 || (x - 1 >= 0 && grid[x-1][y] == 0) {
            count += 1
        }
        if x + 1 == grid.count || (x + 1 < grid.count && grid[x+1][y] == 0) {
            count += 1
        }
        if y == 0 || (y - 1 >= 0 && grid[x][y-1] == 0) {
            count += 1
        }
        if y + 1 == grid[x].count || (y + 1 < grid[0].count && grid[x][y+1] == 0) {
            count += 1
        }
        return count
    }
}
