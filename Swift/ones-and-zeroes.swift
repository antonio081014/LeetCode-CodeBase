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
}/**
 * https://leetcode.com/problems/ones-and-zeroes/
 * 
 * 
 */ 
// Date: Tue May  4 15:03:10 PDT 2021
class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        let l = strs.count
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1), count: 2)        
        for index in 1 ... l {
            let (x, y) = calculate(strs[index - 1])
            for a in 0 ... m {
                for b in 0 ... n {
                    if a >= x, b >= y {
                        dp[index % 2][a][b] = max(dp[1 - index % 2][a][b], dp[1 - index % 2][a - x][b - y] + 1)
                    } else {
                        dp[index % 2][a][b] = dp[1 - index % 2][a][b]
                    }
                }
            }
        }

        return dp[l % 2][m][n]
    }

    private func calculate(_ text: String) -> (Int, Int) {
        var a = 0
        var b = 0
        for c in text {
            if c == Character("0") {
                a += 1
            } else {
                b += 1
            }
        }
        return (a, b)
    }
}