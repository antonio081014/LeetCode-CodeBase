/**
 * https://leetcode.com/problems/partition-labels/
 * 
 * 
 */ 
// Date: Fri Sep  4 22:04:17 PDT 2020
/// - Complexity:
///     - Time: O(n), n is the length of S.
///     - Space: O(26), a - z.
class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var lastIndex: [Character : Int] = [:]
        for (index, c) in S.enumerated() {
            lastIndex[c] = index
        }
        var result = [Int]()
        var start = 0
        var end = 0
        for (index, c) in S.enumerated() {
            end = max(end, lastIndex[c, default: -1])
            if index == end {
                result.append(end - start + 1)
                start = end + 1
            }
        }
        return result
    }
}