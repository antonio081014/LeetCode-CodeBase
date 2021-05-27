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
}