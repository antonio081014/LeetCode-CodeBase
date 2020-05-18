/**
 * https://leetcode.com/problems/permutation-in-string/
 * 
 * 
 */ 
// Date: Mon May 18 07:27:25 PDT 2020
class Solution {
    func checkInclusion(_ p: String, _ s: String) -> Bool {
        if s.count < p.count { return false }
        
        let s = Array(s).map { letterIndex($0) }
        let p = Array(p).map { letterIndex($0) }
        
        var count1 = Array(repeating: 0, count: 26)
        var count2 = Array(repeating: 0, count: 26)
        
        for c in p {
            count2[c] += 1
        }
       
        for index in 0 ..< s.count {
            count1[s[index]] += 1
            if index >= p.count {
                count1[s[index - p.count]] -= 1
            }
            if count1 == count2 {
                return true
            }
        }

        return false
    }
    
    private func letterIndex(_ letter: Character) -> Int {
        return Int(letter.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
    }
}