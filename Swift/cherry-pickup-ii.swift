/**
 * https://leetcode.com/problems/cherry-pickup-ii/
 * 
 * 
 */ 
// Date: Sat Dec 19 19:57:27 PST 2020
class Solution {
    func cherryPickup(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var cost = Array(repeating: Array(repeating: Array(repeating: -1, count: m), count: m), count: n)
        
        func dfs(_ row: Int, _ col1: Int, _ col2: Int) {
            if cost[row][col1][col2] != -1 { return }
            var result = grid[row][col1]
            if col1 != col2 { result += grid[row][col2] }
            if row + 1 < n {
                var maxNext = 0
                for c1 in (col1 - 1) ... (col1 + 1) {
                    for c2 in (col2 - 1) ... (col2 + 1) {
                        if c1 >= 0, c1 < m, c2 >= 0, c2 < m {
                            dfs(row + 1, c1, c2)
                            maxNext = max(maxNext, cost[row + 1][c1][c2])
                        }
                        
                    }
                }
                result += maxNext
            }
            
            cost[row][col1][col2] = result
        }
        
        dfs(0, 0, m - 1)
        return cost[0][0][m - 1]
    }
}/**
 * https://leetcode.com/problems/cherry-pickup-ii/
 * 
 * 
 */ 
// Date: Mon Jan 10 18:39:06 PST 2022
class Solution {
    func cherryPickup(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var dp = Array(repeating:
                        Array(repeating:
                                Array(repeating: -1,
                                      count: m),
                              count: m),
                       count: n)
        func calc(_ row: Int, _ col1: Int, _ col2: Int) -> Int {
            if col1 < 0 || col1 >= m || col2 < 0 || col2 >= m { return 0 }
            if dp[row][col1][col2] >= 0 { return dp[row][col1][col2] }
            var result = 0
            result += grid[row][col1]
            if col1 != col2 {
                result += grid[row][col2]
            }
            
            if row + 1 < n {
                var bestChoice = 0
                for nxtCol1 in (col1 - 1) ... (col1 + 1) {
                    for nxtCol2 in (col2 - 1) ... (col2 + 1) {
                        bestChoice = max(bestChoice, calc(row + 1, nxtCol1, nxtCol2))
                    }
                }
                result += bestChoice
            }
            
            dp[row][col1][col2] = result
            return result
        }
        
        return calc(0, 0, m - 1)
    }
}
