/**
 * https://leetcode.com/problems/compare-version-numbers/
 * 
 * 
 */ 
class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let v1 = version1.components(separatedBy: ".").map({Int($0)!})
        let v2 = version2.components(separatedBy: ".").map({Int($0)!})
        let n = max(v1.count, v2.count)
        for i in 0..<n {
            var a = 0
            var b = 0
            if i < v1.count { a = v1[i] }
            if i < v2.count { b = v2[i] }
            if a < b {
                return -1
            } else if a > b {
                return 1
            }
        }
        return 0
    }
}
/**
 * https://leetcode.com/problems/compare-version-numbers/
 * 
 * 
 */ 
// Date: Wed Sep  9 08:06:14 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time Complexity: O(max(n, m))
    ///     - Space Complexity: O(max(n, m))
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        // - Time Complexity: O(n)
        // - Space Complexity: O(n)
        var v1 = version1.split(separator: ".").map { Int($0)! }
        // - Time Complexity: O(m)
        // - Space Complexity: O(m)
        var v2 = version2.split(separator: ".").map { Int($0)! }
        let n = max(v1.count, v2.count)
        // - Space Complexity: O(max(n, m))
        if v1.count < n {
            v1 += Array(repeating: 0, count: n - v1.count)
        } else {
            v2 += Array(repeating: 0, count: n - v2.count)
        }
        var index = 0
        // - Time Complexity: O(max(n, m))
        while index < v1.count {
            if v1[index] != v2[index] {
                if v1[index] < v2[index] { return -1 }
                return 1
            }
            index += 1
        }
        return 0
    }
}