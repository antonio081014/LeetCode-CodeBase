/**
 * https://leetcode.com/problems/path-with-minimum-effort/
 * 
 * 
 */ 
// Date: Tue Jan 26 09:10:56 PST 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(n * m)
    ///     - Space: O(n * m)
    /// 
    /// Using BFS to find all the efforts in each cell starting at (0, 0).
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let n = heights.count
        guard let m = heights.first?.count else { return -1 }
        var efforts = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        efforts[0][0] = 0
        var queue = [(0, 0)]
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        while queue.isEmpty == false {
            let (x, y) = queue.removeFirst()
            for index in 0 ..< dx.count {
                let xx = x + dx[index]
                let yy = y + dy[index]
                
                if xx >= 0, xx < n, yy >= 0, yy < m, max(efforts[x][y], abs(heights[xx][yy] - heights[x][y])) < efforts[xx][yy] {
                    efforts[xx][yy] = max(efforts[x][y], abs(heights[xx][yy] - heights[x][y]))
                    queue.append((xx, yy))
                }
            }
        }
        // print(efforts)
        return efforts[n - 1][m - 1]
    }
}