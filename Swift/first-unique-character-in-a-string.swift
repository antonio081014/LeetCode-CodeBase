class Solution {
    func firstUniqChar(s: String) -> Int {
        var dict = [Character: Int]()
        var position = [Character: Int]()
        
        var index = 0
        for c in s.characters {
            if let count = dict[c] {
                dict[c] = count + 1
            } else {
                dict[c] = 1
                position[c] = index
            }
            index += 1
        }
        
        var minP = s.characters.count
        
        for (c, v) in dict {
            if v == 1 {
                minP = min(minP, position[c]!)
            }
        }
        return minP == s.characters.count ? -1 : minP
    }
}/**
 * https://leetcode.com/problems/first-unique-character-in-a-string/
 * 
 * 
 */ 
// Date: Sun May  3 15:32:53 PDT 2020
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var count: [String: Int] = [:]
        let s = Array(s)
        for c in s {
            count[String(c)] = 1 + count[String(c), default: 0]
        }
        
        for index in 0 ..< s.count {
            if 1 == count[String(s[index])]! {
                return index
            }
        }
        return -1
    }
}
