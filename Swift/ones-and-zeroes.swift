/**
 * https://leetcode.com/problems/ones-and-zeroes/
 * 
 * 
 */ 
// Date: Tue May  4 14:51:40 PDT 2021
class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        let l = strs.count
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1), count: l + 1)
        let count: [(Int, Int)] = strs.map {
            var a = 0
            var b = 0
            for c in $0 {
                if c == Character("0") {
                    a += 1
                } else {
                    b += 1
                }
            }
            return (a, b)
        }
        
        for index in 1 ... l {
            let (x, y) = count[index - 1]
            for a in 0 ... m {
                for b in 0 ... n {
                    if a >= x, b >= y {
                        dp[index][a][b] = max(dp[index - 1][a][b], dp[index - 1][a - x][b - y] + 1)
                    } else {
                        dp[index][a][b] = dp[index - 1][a][b]
                    }
                }
            }
        }

        return dp[l][m][n]
    }
}