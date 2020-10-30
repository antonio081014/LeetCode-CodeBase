/**
 * https://leetcode.com/problems/bag-of-tokens/
 * 
 * 
 */ 
// Date: Fri Oct 30 11:52:25 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(nlogn + n), n is tokens.count
    ///     - Space: O(n), to store the sorted tokens.
    func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
        let tokens = tokens.sorted()
        var left = 0
        var right = tokens.count - 1
        var p = P
        var points = 0
        var result = 0
        while left <= right && (p >= tokens[left] || points > 0) {
            while left <= right, p >= tokens[left] {
                points += 1
                p -= tokens[left]
                left += 1
            }
            result = max(result, points)
            if left <= right, points > 0 {
                points -= 1
                p += tokens[right]
                right -= 1
            }
        }
        return result
    }
}