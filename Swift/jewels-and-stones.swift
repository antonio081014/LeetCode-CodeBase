/**
 * https://leetcode.com/problems/jewels-and-stones/
 * 
 * 
 */ 
// Date: Sat May  2 12:59:05 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(len(J) + len(S))
    ///     - Space: O(len(J))
    ///
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let jews = Set<String>(Array(J).map { String($0) })
        var count = 0
        for c in S {
            if jews.contains(String(c)) {
                count += 1
            }
        }
        return count
        
    }
}
