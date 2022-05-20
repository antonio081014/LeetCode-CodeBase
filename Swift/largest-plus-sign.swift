class Solution {
    func orderOfLargestPlusSign(_ n: Int, _ mines: [[Int]]) -> Int {
        let nonVisitable = Set(mines.map { $0[0] * n + $0[1] })
        var dp = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        
        for x in 0 ..< n {
            var count1 = 0
            var count2 = 0
            for y in 0 ..< n {
                if nonVisitable.contains(x * n + y) {
                    count1 = 0
                } else {
                    count1 += 1
                }
                if nonVisitable.contains(x * n + n - y - 1) {
                    count2 = 0
                } else {
                    count2 += 1
                }
                dp[x][y] = min(dp[x][y], count1)
                dp[x][n - 1 - y] = min(dp[x][n - 1 - y], count2)
            }
        }
        
        for y in 0 ..< n {
            var count1 = 0
            var count2 = 0
            for x in 0 ..< n {
                if nonVisitable.contains(x * n + y) {
                    count1 = 0
                } else {
                    count1 += 1
                }
                if nonVisitable.contains((n - 1 - x) * n + y) {
                    count2 = 0
                } else {
                    count2 += 1
                }
                dp[x][y] = min(dp[x][y], count1)
                dp[n - 1 - x][y] = min(dp[n - 1 - x][y], count2)
            }
        }
        // print(dp)
        var result = 0
        for x in 0 ..< n {
            for y in 0 ..< n {
                result = max(result, dp[x][y])
            }
        }
        return result
    }
}
