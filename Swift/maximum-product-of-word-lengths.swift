/**
 * https://leetcode.com/problems/maximum-product-of-word-lengths/
 * 
 * 
 */ 
// Date: Thu May 27 08:38:11 PDT 2021
class Solution {
    func maxProduct(_ words: [String]) -> Int {
        var map: [String : Set<Character>] = [:]
        for word in words {
            var set: Set<Character> = []
            for c in word {
                set.insert(c)
            }
            map[word] = set
        }
        var result = 0
        for index1 in stride(from: 1, to: words.count, by: 1) {
            let set1 = map[words[index1], default: []]
            for index2 in stride(from: 0, to: index1, by: 1) {
                let set2 = map[words[index2], default: []]
                if set1.isDisjoint(with: set2) {
                    result = max(result, words[index1].count * words[index2].count)
                }
            }
        }
        return result
    }
}/**
 * https://leetcode.com/problems/maximum-product-of-word-lengths/
 * 
 * 
 */ 
// Date: Thu May 27 08:49:32 PDT 2021
class Solution {
    func maxProduct(_ words: [String]) -> Int {
        var map: [Set<Character> : String] = [:]
        for word in words {
            var set: Set<Character> = []
            for c in word {
                set.insert(c)
            }
            if let w = map[set] {
                map[set] = w.count > word.count ? w : word
            } else {
                map[set] = word
            }
        }
        var result = 0
        let keys = Array(map.keys)
        for index1 in stride(from: 1, to: keys.count, by: 1) {
            let set1 = keys[index1]
            for index2 in stride(from: 0, to: index1, by: 1) {
                let set2 = keys[index2]
                if set1.isDisjoint(with: set2) {
                    result = max(result, map[set1, default: ""].count * map[set2, default: ""].count)
                }
            }
        }
        return result
    }
}