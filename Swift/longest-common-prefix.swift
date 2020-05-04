/**
 * https://leetcode.com/problems/longest-common-prefix/
 * 
 * 
 */ 
// Date: Mon May  4 10:45:40 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(log(first.count) * strs.count * (length of each s in strs)), so it's O(log(first.count) * number of all characters)
    ///     - Space: O(1)
    ///
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first else { return "" }
        var left = 0
        var right = first.count
        while left < right {
            let mid = left + (right - left) / 2
            let prefix = String(first[first.startIndex ... first.index(first.startIndex, offsetBy: mid)])
            var pass = true
            for s in strs {
                if s.hasPrefix(prefix) == false {
                    pass = false
                    break
                }
            }
            if pass {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left == 0 ? "" : String(first[first.startIndex ..< first.index(first.startIndex, offsetBy: left)])
    }
}
