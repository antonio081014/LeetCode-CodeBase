/**
 * https://leetcode.com/problems/find-the-shortest-superstring/
 * 
 * 
 */ 
// Date: Wed Aug 18 16:39:57 PDT 2021
class Solution {
    /// - Reference: 
    ///     [Youtube Hua Hua](https://youtu.be/u_Wc4jwrp3Q)
    /// - Complexity:
    ///     - Time: O(2^n * n^2), n is the length of words array.
    ///     - Space: O(2^n * n), n is the length of words array.
    func shortestSuperstring(_ words: [String]) -> String {
        let n = words.count
        var mask = (1 << n)

        var cost = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0 ..< n {
            for j in 0 ..< n {
                cost[i][j] = self.distance(words[i], words[j])
            }
        }
        // Calculate the shortest possible string length with 
        // - mask: indicates the selected/handled words
        // - index: the index of last word in current shortest solution.
        var dp = Array(repeating: Array(repeating: Int.max / 2, count: n), count: mask )

        var parent = Array(repeating: Array(repeating: -1, count: n), count: mask)

        for index in 0 ..< n {
            dp[1 << index][index] = words[index].count
        }

        for s in 1 ..< mask {
            for index in 0 ..< n {
                if ((1 << index) & s) == 0 { continue }
                let prev = s - (1 << index)
                for j in 0 ..< n {
                    if dp[prev][j] + cost[j][index] < dp[s][index] {
                        dp[s][index] = dp[prev][j] + cost[j][index]
                        parent[s][index] = j
                    }
                }
            }
        }

        var resultIndex = 0
        mask -= 1
        for index in 1 ..< n {
            if dp[mask][index] < dp[mask][resultIndex] {
                resultIndex = index
            }
        }

        var result = words[resultIndex]
        while resultIndex >= 0 {
            let p = parent[mask][resultIndex]
            if p < 0 { return result }
            result = self.combine(words[p], words[resultIndex], words[resultIndex].count - cost[p][resultIndex]) + result
            mask -= 1 << resultIndex
            resultIndex = p
        }
        return result
    }

    func combine(_ a: String, _ b: String, _ commonLength: Int) -> String {
        guard a.count - commonLength > 0 else { return "" }
        let a = Array(a)
        return String(a[0 ..< (a.count - commonLength)])
    }

    func distance(_ a: String, _ b: String) -> Int {
        let a = Array(a)
        let b = Array(b)
        var result = 0
        for k in 1 ... min(a.count, b.count) {
            if a[(a.count - k) ..< a.count] == b[0 ..< k] {
                result = k
            }
        }
        return b.count - result
    }
}