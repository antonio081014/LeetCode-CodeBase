// Mon Jul 18 09:19:08 PDT 2022
class Solution {
    var memo = Array(repeating: Array(repeating: -1, count: 1001), count: 1001)
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        if n == 0 { return 0 }
        if k == 0 { return 1 }
        if memo[n][k] >= 0 { return memo[n][k] }
        var result = 0
        for index in 0 ... min(k, n - 1) {
            result = (result + kInversePairs(n - 1, k - index)) % 1000000007
        }
        memo[n][k] = result
        return result
    }
}

// Mon Jul 18 09:26:15 PDT 2022
class Solution {
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        let mod = 1000000007
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
        for x in 1 ... n {
            for y in 0 ... k {
                if y == 0 {
                    dp[x][y] = 1
                } else {
                    var val = 0
                    for step in 0 ... min(x - 1, y) {
                        val = (val + dp[x - 1][y - step]) % mod
                    }
                    
                    dp[x][y] = (dp[x][y] + val) % mod
                }
            }
        }
        print(dp)
        return dp[n][k]
    }
}

// Mon Jul 18 16:17:35 PDT 2022
class Solution {
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        let mod = 1000000007
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
        for x in 1 ... n {
            for y in 0 ... k {
                if y == 0 {
                    dp[x][y] = 1
                } else {
                    let val = (dp[x - 1][y] - (y >= x ? dp[x - 1][y - x]: 0) + mod) % mod
                    dp[x][y] = (dp[x][y - 1] + val) % mod
                }
            }
        }
        // print(dp)
        return (dp[n][k] + mod - (k > 0 ? dp[n][k - 1] : 0)) % mod
    }
}
