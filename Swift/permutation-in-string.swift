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


// Fri Feb 11 08:47:52 PST 2022
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let len1 = s1.count
        let len2 = s2.count
        
        var count1 = [Character : Int]()
        for c in s1 {
            count1[c, default: 0] += 1
        }
        
        var count2 = [Character : Int]()
        let s2 = Array(s2)
        for index in 0 ..< len2 {
            let c = s2[index]
            count2[c, default: 0] += 1
            if index >= len1, let v = count2[s2[index - len1]] {
                count2[s2[index - len1]] = v > 1 ? v - 1 : nil
            }
            if count1 == count2 { return true }
        }
        return false
    }
}
