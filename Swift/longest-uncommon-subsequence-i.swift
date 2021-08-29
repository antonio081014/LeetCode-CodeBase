/**
 * https://leetcode.com/problems/longest-uncommon-subsequence-i/
 * 
 * 
 */ 
// Date: Sun Aug 29 13:37:15 PDT 2021
class Solution {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        if a == b { return -1 }
        return max(a.count, b.count)
    }
}