/**
 * https://leetcode.com/problems/remove-boxes/
 * 
 * 
 */ 
// Date: Fri Aug 27 11:56:14 PDT 2021
class Solution {
    /// Probably the hardest DP problem I've ever seen.
    /// Reference Link: https://www.youtube.com/watch?v=wT7aS5fHZhs
    /// - Complexity:
    ///     - Time: O(n^4)
    ///     - Space: O(n^3)
    private var dp: [[[Int]]] = []
    func removeBoxes(_ boxes: [Int]) -> Int {
        let n = boxes.count
        dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n), count: n), count: n)
        return dfs(boxes, 0, n - 1, 0)
    }

    private func dfs(_ boxes: [Int], _ l: Int, _ r: Int, _ k: Int) -> Int {
        if l > r { return 0 }
        if dp[l][r][k] > 0 { return dp[l][r][k] }
        var rr = r
        var kk = k
        while l < rr && boxes[rr] == boxes[rr - 1] {
            rr -= 1
            kk += 1
        }
        dp[l][r][k] = dfs(boxes, l, rr - 1, 0) + (kk + 1) * (kk + 1)
        for index in l ..< rr {
            if boxes[index] == boxes[rr] {
                dp[l][r][k] = max(dp[l][r][k], dfs(boxes, l, index, kk + 1) + dfs(boxes, index + 1, rr - 1, 0))
            }
        }
        return dp[l][r][k]
    }
}