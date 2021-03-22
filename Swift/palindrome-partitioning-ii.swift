/**
 * https://leetcode.com/problems/palindrome-partitioning-ii/
 * 
 * 
 */ 
// Date: Sun Mar 21 18:26:22 PDT 2021
class Solution {
    func minCut(_ s: String) -> Int {
        let s = Array(s)
        // number of cuts for the first k characters
        var minCuts = Array(-1 ..< s.count)
        

        for center in 0 ..< s.count {
            var offset = 0
            // Palindrome with odd length
            while center - offset >= 0, center + offset < s.count, s[center - offset] == s[center + offset] {
                minCuts[center + offset + 1] = min(minCuts[center + offset + 1], 1 + minCuts[center - offset])
                offset += 1
            }
            offset = 0
            // Palindrome with even length
            while center - offset >= 0, center + 1 + offset < s.count, s[center - offset] == s[center + offset + 1] {
                minCuts[center + offset + 1 + 1] = min(minCuts[center + offset + 1 + 1], 1 + minCuts[center - offset])
                offset += 1
            }
        }
        // print(minCuts)
        return minCuts[s.count]
    }
}