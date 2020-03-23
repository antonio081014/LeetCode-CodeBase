/**
 * LeeCode 1391: Check if There is a Valid Path in a Grid
 *
 * Using BFS to visit all the possible cells from start point (0, 0)
 *
 * - Complexity: Time and Space: O(n * m),
 *  which is the number of rows and number of colums in the 2-dimension array.
 *
 * The key part is at each valid cell, try through all the possble next cell (xx, yy) based on the rules and current cell (x, y).
 *
 * When checking the validation of next cell, need to check
 *  If (xx, yy) is not out of current matrix.
 *  If (xx, yy) has not been visited before, otherwise, duplicates will be added, it would be unlimited cells to visit, which results exceeds time limit.
 *  If (xx, yy) is able to getting back to (x, y), otherwise, it's not valid, which means it should be connected well.

 */
class Solution {
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let n = grid.count
        guard n > 0, let m = grid.first?.count, m > 0 else { return false}
        
        // List of direction options.
        let dirs = [(0, -1), (-1, 0), (0, 1), (1 ,0)] // Left, Up, Right, Down
        
        // Map cell number to corresponding direction options.
        let rules = [
            [],
            [0, 2],
            [1, 3],
            [0, 3],
            [2, 3],
            [0, 1],
            [1, 2]
        ]
        
        // Mark the cell if it has been visited.
        var marked = Array(repeating: Array(repeating: false, count: m), count: n)
        
        var queue = [(0, 0)]
        marked[0][0] = true
        
        while queue.isEmpty == false {
            let (x, y) = queue.removeFirst()
            // print("\(grid[x][y]) : \(x) - \(y)")
            if x == n - 1, y == m - 1 { return true }
            
            for ruleChoice in rules[grid[x][y]] {
                let xx = x + dirs[ruleChoice].0
                let yy = y + dirs[ruleChoice].1
                // print("(xx, yy) : (\(xx), \(yy))")
                // 1, check the validation of boundary
                // 2, if it has not been visited
                // 3, if it has the opposite direction of current (x, y)'s direction `ruleChoice`
                if xx >= 0, xx < n, yy >= 0, yy < m, marked[xx][yy] == false, rules[grid[xx][yy]].contains((ruleChoice + 2) % dirs.count) {
                    marked[xx][yy] = true
                    queue.append((xx, yy))
                }
            }
        }
        return false
    }
}
