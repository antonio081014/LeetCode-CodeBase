/**
 * https://leetcode.com/problems/longest-increasing-path-in-a-matrix/
 * 
 * 
 */ 
// Date: Thu Jul 30 16:41:31 PDT 2020
class Solution {
    enum MatrixState {
        case noneVisited
        case visited(maxLength: Int)
    }

    /// From each cell (x, y), try to get the longest path along the way in an increasing order.
    /// With the help of memorization, each cell, as the start point, will be calculcated once only.
    ///
    /// - Complexity:
    ///     - Time: O(m*n)
    ///     - Space: O(m*n)
    ///
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        guard let m = matrix.first?.count else { return 0 }
        var maxLen = Array(repeating: Array(repeating: MatrixState.noneVisited, count: m), count: n)

        func dfs(_ x: Int, _ y: Int) -> Int {
            if case MatrixState.visited(let maxLength) = maxLen[x][y] {
                return maxLength
            }

            let dx = [0, 1, 0, -1]
            let dy = [1, 0, -1, 0]

            var maxLength = 0

            for index in 0 ..< dx.count {
                let xx = x + dx[index]
                let yy = y + dy[index]

                if xx >= 0, xx < n, yy >= 0, yy < m, matrix[xx][yy] > matrix[x][y] {
                    maxLength = max(maxLength, dfs(xx, yy))
                }
            }
            maxLen[x][y] = MatrixState.visited(maxLength: 1 + maxLength)
            return 1 + maxLength
        }

        var result = 0
        for x in 0 ..< n {
            for y in 0 ..< m {
                if case MatrixState.noneVisited = maxLen[x][y] {
                    let len = dfs(x, y)
                    result = max(result, len)
                }
            }
        }
        return result
    }
}
/**
 * https://leetcode.com/problems/longest-increasing-path-in-a-matrix/
 * 
 * 
 */ 
// Date: Sat Apr 10 07:57:04 PDT 2021
class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        guard let m = matrix.first?.count else { return 0 }
        var longestPath = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        
        func dfs(_ x: Int, _ y: Int) {
            if longestPath[x][y] > 0 { return }
            longestPath[x][y] = 1
            for index in 0 ..< dx.count {
                let xx = x + dx[index]
                let yy = y + dy[index]
                if xx >= 0, xx < n, yy >= 0, yy < m, matrix[xx][yy] < matrix[x][y]{
                    dfs(xx, yy)
                    longestPath[x][y] = max(longestPath[x][y], 1 + longestPath[xx][yy])
                }
            }
        }
        
        var result = 0
        for x in 0 ..< n {
            for y in 0 ..< m {
                dfs(x, y)
                result = max(result, longestPath[x][y])
            }
        }
        return result
    }
}