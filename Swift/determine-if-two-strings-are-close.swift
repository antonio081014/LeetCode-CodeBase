/**
 * https://leetcode.com/problems/determine-if-two-strings-are-close/
 * 
 * 
 */ 
// Date: Fri Jan 22 09:07:14 PST 2021
class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        var count1 = Array(repeating: 0, count: 26)
        var count2 = Array(repeating: 0, count: 26)
        for c in word1 {
            count1[Int(c.asciiValue!) - 97] += 1
        }
        for c in word2 {
            count2[Int(c.asciiValue!) - 97] += 1
        }
        for index in 0 ..< 26 {
            if count1[index] > 0 && count2[index] == 0 { return false }
            if count2[index] > 0 && count1[index] == 0 { return false }
        }
        count1.sort()
        count2.sort()
        // print("\(count1) - \(count2)")
        return count1 == count2
    }
}