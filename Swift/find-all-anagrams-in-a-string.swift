/**
 * https://leetcode.com/problems/find-all-anagrams-in-a-string/
 * 
 * 
 */ 
// Date: Sun May 17 14:18:56 PDT 2020
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count { return [] }
        
        let s = Array(s).map { letterIndex($0) }
        let p = Array(p).map { letterIndex($0) }
        
        var count1 = Array(repeating: 0, count: 26)
        var count2 = Array(repeating: 0, count: 26)
        
        for c in p {
            count2[c] += 1
        }
        
        var ret: [Int] = []
        
        for index in 0 ..< s.count {
            count1[s[index]] += 1
            if index >= p.count {
                count1[s[index - p.count]] -= 1
            }
            if count1 == count2 {
                ret += [index - p.count + 1]
            }
        }
        
        return ret
    }
    
    private func letterIndex(_ letter: Character) -> Int {
        return Int(letter.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
    }
}

/// This solution: TLE.
/// - Complexity:
///     - Time: O(p.count + s.count * 26), 26 indicates 'a' to 'z' for dictionary lookup.
///     - Space: O(26), dictionary to store the counts of each character.
///
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count { return [] }
        
        let s = Array(s)
        var count: [Character : Int] = [:]
        for c in p {
            count[c] = 1 + count[c, default: 0]
        }
        
        var ret: [Int] = []
        
        var index = 0
        while index < p.count {
            let c = s[index]
            if let val = count[c] {
                count[c] = val - 1
            }
            index += 1
        }
        if isValid(count) { ret.append(0) }
        
        while index < s.count {
            let c = s[index]
            let exC = s[index - p.count]
            index += 1
            
            if let val = count[exC] {
                count[exC] = val + 1
            }
            if let val = count[c] {
                count[c] = val - 1
            } else {
                continue
            }
            
            if self.isValid(count) {
                ret.append(index - p.count)
            }
            
        }
        return ret
    }
    
    private func isValid(_ dict: [Character: Int]) -> Bool {
        let keys = "abcdefghijkmlnopqrstuvwxyz"
        for key in keys {
            if let val = dict[key], val != 0 { return false }
        }
        return true
    }
}

/// Figured out the key point to make this code work from TLE to AC.
/// String.count function actually takes O(n) time to count the length of string,
/// So using p.count in the loop will make this algorithm O(m * n), m, n are lengths of two strings.
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let sLen = s.count
        let pLen = p.count
        if sLen < pLen { return [] }
        
        var pattern = [Character : Int]()
        for c in p {
            pattern[c, default: 0] += 1
        }
        
        var result = [Int]()
        var match = [Character : Int]()
        
        let s = Array(s)
        for index in 0 ..< sLen {
            match[s[index], default: 0] += 1
            
            if index >= pLen {
                match[s[index - pLen], default: 0] -= 1
                if match[s[index - pLen], default: 0] == 0 {
                    match[s[index - pLen]] = nil
                }
            }
            
            if pattern == match {
                result.append(index - pLen + 1)
            }
        }
        return result
    }
}
