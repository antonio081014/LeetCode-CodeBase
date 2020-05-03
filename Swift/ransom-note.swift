class Solution {
    func canConstruct(ransomNote: String, _ magazine: String) -> Bool {
        var dict = [Character: Int]()
        for c in magazine.characters {
            if let count = dict[c] {
                dict[c] = count + 1
            } else {
                dict[c] = 1
            }
        }
        for c in ransomNote.characters {
            if let count = dict[c] {
                dict[c] = count - 1
                if dict[c] < 0 {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}
/**
 * https://leetcode.com/problems/ransom-note/
 * 
 * 
 */ 
// Date: Sun May  3 09:28:18 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(m + n), m,n is the lenght of ransomeNote and magazine.
    ///     - Space: O(26), 'a' - 'z'
    ///
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var count: [String : Int] = [:]
        
        for c in magazine {
            count[String(c)] = 1 + count[String(c), default: 0]
        }
        
        for c in ransomNote {
            count[String(c)] = count[String(c), default: 0] - 1
            if count[String(c), default: 0] < 0 {
                return false
            }
        }
        return true
    }
}
