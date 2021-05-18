/**
 * https://leetcode.com/problems/longest-string-chain/
 * 
 * 
 */ 
// Date: Mon May 17 17:33:01 PDT 2021
class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        var map: [[Character] : Int] = [:]
        let dict = Set(words.map { Array($0) })
        func dfs(_ word: [Character]) -> Int {
            if let count = map[word] { return count }
            var result = 0
            var w = word
            var len = word.count
            for index in 0 ..< len {
                let c = w[index]
                w.remove(at: index)
                if dict.contains(w) {
                    result = max(result, dfs(w))
                }
                w.insert(c, at: index)
            }

            map[word] = 1 + result
            return 1 + result
        }
        var result = 0
        for w in words {
            result = max(result, dfs(Array(w)))
        }
        return result
    }
}