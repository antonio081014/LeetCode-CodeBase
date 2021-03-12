/**
 * https://leetcode.com/problems/check-if-a-string-contains-all-binary-codes-of-size-k/
 * 
 * 
 */ 
// Date: Fri Mar 12 11:25:30 PST 2021
class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        var list: Set<String> = []
        var cand: [Character] = []
        for c in s {
            cand.append(c)
            if cand.count == k {
                list.insert(String(cand))
                cand.removeFirst()
            }
        }
        var expected = 1
        for _ in 0 ..< k { expected *= 2 }
        return list.count == expected
    }
}