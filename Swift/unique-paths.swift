/**
 * https://leetcode.com/problems/unique-paths/
 * 
 * 
 */ 
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var count:[[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        count[0][0] = 1
        for i in 0 ..< n {
            for j in 0 ..< m {
                if i > 0 || j > 0 {
                    if i > 0 {
                        count[i][j] += count[i-1][j]
                    }
                    if j > 0 {
                        count[i][j] += count[i][j-1]
                    }
                }
            }
        }
        return count[n - 1][m - 1]
    }
}