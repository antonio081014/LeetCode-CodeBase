/**
 * https://leetcode.com/problems/add-binary/
 * 
 * 
 */ 
// Date: Sun Jul 19 09:53:06 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(m + n + max(n, m)), m and n are the length of each string
    ///     - Space: O(m + n), m and n are the length of each string
    ///
    func addBinary(_ a: String, _ b: String) -> String {
        var ret = ""
        var offset = 0
        let a = Array(a).map { Int(String($0))! }
        let b = Array(b).map { Int(String($0))! }
        var index1 = a.count - 1
        var index2 = b.count - 1
        while index1 >= 0 || index2 >= 0 || offset > 0 {
            var sum = offset
            if index1 >= 0 {
                sum += a[index1]
                index1 -= 1
            }
            if index2 >= 0 {
                sum += b[index2]
                index2 -= 1
            }
            ret = String(sum % 2) + ret
            offset = sum / 2
        }
        return ret
    }
}
