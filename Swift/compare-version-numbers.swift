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
