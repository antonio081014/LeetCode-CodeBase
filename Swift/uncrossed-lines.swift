/**
 * https://leetcode.com/problems/uncrossed-lines/
 * 
 * 
 */ 
// Date: Mon May 25 10:16:48 PDT 2020
class Solution {
    /// Longest Common Elements
    /// - Complexity:
    ///     - Time: O(n*m), n and m are the length of arrays.
    ///     - Space: O(n*m), n and m are the length of arrays.
    /// mark[x][y], indicates maximum number of lines could be draw without intersection.
    ///
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        let n = A.count
        let m = B.count
        var mark = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        for x in 1 ... n {
            for y in 1 ... m {
                if A[x - 1] == B[y - 1] {
                    mark[x][y] = 1 + mark[x - 1][y - 1]
                }
                mark[x][y] = max(mark[x][y], mark[x - 1][y])
                mark[x][y] = max(mark[x][y], mark[x][y - 1])
            }
        }
        return mark[n][m]
    }
}
