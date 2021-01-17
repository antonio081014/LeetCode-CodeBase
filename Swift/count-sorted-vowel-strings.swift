/**
 * https://leetcode.com/problems/count-sorted-vowel-strings/
 * 
 * 
 */ 
// Date: Sun Jan 17 09:11:20 PST 2021
class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var a = 1, e = 1, i = 1, o = 1, u = 1
        for j in 1..<n{
            a = (a+e+i+o+u)
            e = (e+i+o+u)
            i = (i+o+u)
            o = (o+u)
        }
        return (a+e+i+o+u)
    }
}/**
 * https://leetcode.com/problems/count-sorted-vowel-strings/
 * 
 * 
 */ 
// Date: Sun Jan 17 09:30:41 PST 2021
class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: 5), count: n + 1)
        for x in 0 ..< 5 {
            dp[0][x] = 1
        }
        /// j:
        ///     0 -> 'u'
        ///     1 -> 'o'
        ///     2 -> 'i'
        ///     3 -> 'e'
        ///     4 -> 'a'
        for x in 1 ... n {
            dp[x][0] = dp[x - 1][0]
            for j in 1 ..< 5 {
                dp[x][j] = dp[x - 1][j] + dp[x][j - 1]
            }
        }
        // print(dp)
        return dp[n][4]
    }
}