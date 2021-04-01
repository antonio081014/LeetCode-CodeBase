/**
 * https://leetcode.com/problems/russian-doll-envelopes/
 * 
 * 
 */ 
// Date: Tue Mar 30 12:04:09 PDT 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(n^2)
    ///     - Space: O(n)
    // TLE on leetcode. but this algorithm could pass written in C++.
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let n = envelopes.count
        var dolls = Array(repeating: 0, count: n)
        var result = 0
        let env = envelopes.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
        // print(env)
        for index in stride(from: 1, to: n, by: 1) {
            for start in stride(from: index - 1, through: 0, by: -1) {
                if env[index][0] > env[start][0] && env[index][1] > env[start][1] {
                    dolls[index] = max(dolls[index], 1 + dolls[start])
                }
            }
            result = max(result, dolls[index])
        }
        return result + 1
    }
}/**
 * https://leetcode.com/problems/russian-doll-envelopes/
 * 
 * 
 */ 
// Date: Thu Apr  1 11:24:26 PDT 2021
class Solution {
    /// - Complexity: 
    ///     - Time: O(nlgn)
    ///     - Space: O(n)
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let n = envelopes.count
        var dolls = Array(repeating: 0, count: n)
        var end = 0
        let env = envelopes.sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] }
        // print(env)
        
        for e in env {
            var left = 0
            var right = end
            while left < right {
                let mid = left + (right - left) / 2
                if dolls[mid] < e[1] {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            dolls[left] = e[1]
            if left == end { end += 1 }
        }
        
        return end
    }
}