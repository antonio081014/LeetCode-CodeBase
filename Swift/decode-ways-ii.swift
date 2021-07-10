/**
 * https://leetcode.com/problems/decode-ways-ii/
 * 
 * 
 */ 
// Date: Sat Jul 10 12:05:38 PDT 2021
class Solution {
    func numDecodings(_ s: String) -> Int {
        let n = s.count
        let mod = 1000000007
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        let s = Array(s)
        for index in 0 ..< n {
            if s[index] == Character("*") {
                dp[index + 1] = (dp[index] * 9) % mod
            } else if s[index] != Character("0") {
                dp[index + 1] = dp[index]
            }

            if index > 0 {
                var flag = 0
                switch (s[index - 1], s[index]) {
                    case (Character("1"), Character("*")):
                        flag = 9
                    case (Character("2"), Character("*")):
                        flag = 6
                    case (Character("2"), Character("1")):
                        flag = 1
                    case (Character("2"), Character("2")):
                        flag = 1
                    case (Character("2"), Character("3")):
                        flag = 1
                    case (Character("2"), Character("4")):
                        flag = 1
                    case (Character("2"), Character("5")):
                        flag = 1
                    case (Character("2"), Character("6")):
                        flag = 1
                    case (Character("2"), Character("0")):
                        flag = 1
                    case (Character("1"), Character("0")):
                        flag = 1
                    case (Character("1"), _):
                        flag = 1
                    case (Character("*"), Character("6")):
                        flag = 2
                    case (Character("*"), Character("5")):
                        flag = 2
                    case (Character("*"), Character("4")):
                        flag = 2
                    case (Character("*"), Character("3")):
                        flag = 2
                    case (Character("*"), Character("2")):
                        flag = 2
                    case (Character("*"), Character("1")):
                        flag = 2
                    case (Character("*"), Character("0")):
                        flag = 2
                    case (Character("*"), Character("*")):
                        flag = 9 + 6
                    case (Character("*"), _):
                        flag = 1
                    default:
                        flag = 0
                }
                dp[index + 1] += (dp[index - 1] * flag) % mod
                dp[index + 1] %= mod
            }
        }
        return dp[n]
    }
}

