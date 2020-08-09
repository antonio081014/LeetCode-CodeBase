/**
 * https://leetcode.com/problems/rotting-oranges/
 * 
 * 
 */ 
// Date: Sun Aug  9 09:08:49 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(m * n * k), where m, n are the size of grid, k is largest number of cells could be visited from a single rotting cell.
    ///             theoritically, if k i s very large, like m * n, then we would not start visiting m * n times, otherwise, k could be pretty small.
    ///     - Space: O(m * n + k).
    ///
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var minSteps = Array(repeating: Array(repeating: Int.max, count: m), count: n)

        /// BFS
        /// From start point, bfs all the adjacent cells and calculate the minimum distance from start point.
        /// Key part:
        /// Only cells with value 1 is accessible, also recalculation could be needed if smaller possible min steps is met.
        ///
        /// - Complexity:
        ///     - Time: O(m *n), possibly visit every cell from start point.
        ///     - Space: O(m * n), this is the uppper bound.
        ///
        func bfs(_ start: (Int, Int)) {
            let dx = [0, 1, 0, -1]
            let dy = [1, 0, -1, 0]
            minSteps[start.0][start.1] = 0
            var queue = [(start.0, start.1)]
            while queue.isEmpty == false {
                let (x, y) = queue.removeFirst()
                for index in 0 ..< dx.count {
                    let xx = x + dx[index]
                    let yy = y + dy[index]
                    if xx >= 0, xx < n, yy >= 0, yy < m, grid[xx][yy] == 1 {
                        if minSteps[x][y] + 1 < minSteps[xx][yy] {
                            minSteps[xx][yy] = minSteps[x][y] + 1
                            queue.append((xx, yy))
                        }
                    }
                }
            }
        }

        /// Go through each cell, start from each rotting cell.
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] == 2 {
                    bfs((x, y))
                }
            }
        }

        /// After calculation, find out the longest distance possible in this grid.
        /// If any cell with value 1 is not accessible, then return -1
        /// Else, return the biggest number of min steps.
        var steps = 0
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] != 0 {
                    if minSteps[x][y] == Int.max { return -1 }
                    steps = max(steps, minSteps[x][y])
                }
            }
        }
        return steps
    }
}
