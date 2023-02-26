/**
 * https://leetcode.com/problems/find-the-divisibility-array-of-a-string/
 * 
 * 
 */ 
// Date: Sun Feb 26 11:24:24 PST 2023
class Solution {
    func divisibilityArray(_ word: String, _ m: Int) -> [Int] {
        var rem = 0
        var result = [Int]()
        for x in word {
            rem = rem * 10 + Int(String(x))!
            if rem % m == 0 {
                result.append(1)
            } else {
                result.append(0)
            }
            rem = rem % m
        }
        return result
    }
}
