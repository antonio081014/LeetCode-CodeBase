/**
 * https://leetcode.com/problems/longest-palindrome/
 * 
 * 
 */ 
// Date: Fri Aug 14 10:21:35 PDT 2020
/// - Complexity:
///     - Time: O(n), n is the length of s.
///     - Space: O(n), n is the length of s.
///
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var visited: Set<Character> = []
        var count = 0
        for c in s {
            if visited.contains(c) {
                count += 2
                visited.remove(c)
            } else {
                visited.insert(c)
            }
        }
        if visited.isEmpty == false { count += 1 }
        return count
    }
}
