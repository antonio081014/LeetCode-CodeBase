/**
 * https://leetcode.com/problems/edit-distance/
 * 
 * 
 */ 
// Date: Sun May 31 09:18:29 PDT 2020
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = Array(word1)
        let word2 = Array(word2)
        let n = word1.count
        let m = word2.count
        if n == 0 { return m }
        if m == 0 { return n }
        var mark = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        for x in 0 ... n {
            mark[x][0] = x
        }
        for y in 0 ... m {
            mark[0][y] = y
        }
        for x in 1 ... n {
            for y in 1 ... m {
                mark[x][y] = min(min(mark[x - 1][y] + 1, mark[x][y - 1] + 1), mark[x - 1][y - 1] + 1)
                if word1[x - 1] == word2[y - 1] {
                    mark[x][y] = min(mark[x][y], mark[x - 1][y - 1])
                }
            }
        }
        return mark[n][m]
    }
}
