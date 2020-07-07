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
/**
 * https://leetcode.com/problems/island-perimeter/
 * 
 * 
 */ 
// Date: Tue Jul  7 09:19:50 PDT 2020
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var total = 0
        let n = grid.count
        guard let m = grid.first?.count else { return total }
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] != 1 { continue }
                if x == 0 {
                    total += 1
                } else {
                    if grid[x - 1][y] != grid[x][y] {
                        total += 1
                    }
                }
                if y == 0 {
                    total += 1
                } else {
                    total += grid[x][y - 1] != grid[x][y] ? 1 : 0
                }
                
                if x == n - 1 {
                    total += 1
                } else {
                    total += grid[x + 1][y] != grid[x][y] ? 1 : 0
                }
                
                if y == m - 1 {
                    total += 1
                } else {
                    total += grid[x][y + 1] != grid[x][y] ? 1 : 0
                }
            }
        }
        return total
    }
}
/**
 * https://leetcode.com/problems/island-perimeter/
 * 
 * 
 */ 
// Date: Tue Jul  7 09:35:19 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n*m), n and m are sizes of grid.
    ///     - Space: O(1), only use constant space to store sizes and total number of edges of island.  
    ///
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var total = 0
        let n = grid.count
        guard let m = grid.first?.count else { return total }
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] != 1 { continue }
                total += 4
                if x > 0, grid[x - 1][y] == 1 { total -= 2 }
                if y > 0, grid[x][y - 1] == 1 { total -= 2 }
            }
        }
        return total
    }
}
