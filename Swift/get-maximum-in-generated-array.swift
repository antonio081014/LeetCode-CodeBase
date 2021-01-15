/**
 * https://leetcode.com/problems/get-maximum-in-generated-array/
 * 
 * 
 */ 
// Date: Fri Jan 15 09:15:06 PST 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(n)
    ///     - Space: O(n)
    func getMaximumGenerated(_ n: Int) -> Int {
        var result = Array(repeating: -1, count: n + 2)
        result[0] = 0
        result[1] = 1
        var maxNumber = Int.min
        for x in stride(from: 0, through: n, by: 1) {
            if x % 2 == 0 {
                result[x] = result[x / 2]
            } else {
                result[x] = result[x / 2] + result[x / 2 + 1]
            }
            maxNumber = max(maxNumber, result[x])
        }
        return maxNumber
    }
}