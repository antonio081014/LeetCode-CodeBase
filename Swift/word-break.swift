/**
 * https://leetcode.com/problems/word-break/
 * 
 * 
 */ 
class Solution {
    var mark: [[Int]]!
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let n = s.characters.count
        let text:[String] = s.characters.map {String($0)}
        self.mark = Array(repeating: Array(repeating:-1, count: n), count: n)
        self.search(text, wordDict, 0, n-1)
        return self.mark[0][n-1] == 1
    }
    
    private func search(_ s: [String], _ words: [String], _ left: Int, _ right: Int) {
        let text = s[left...right].joined()
        if self.mark[left][right] >= 0 { return }
        self.mark[left][right] = 0
        for word in words {
            let len = word.characters.count
            if len > right - left + 1 {
                continue
            }
            if text.hasPrefix(word) {
                self.mark[left][left+len-1] = 1
                if left + len <= right {
                    self.search(s, words, left+len, right)
                    if self.mark[left+len][right] == 1 {
                        self.mark[left][right] = 1
                        return
                    }
                }
            }
        }
    }
}
/**
 * https://leetcode.com/problems/word-break/
 * 
 * 
 */ 
// Date: Thu Jul 30 10:44:17 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n^2), n is the length of string s.
    ///     - Space: O(n), n is the length of string s.
    ///
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let dict = Set(wordDict)
        let s = Array(s)
        var valid = Array(repeating: false, count: s.count + 1)
        valid[0] = true
        for end in 1 ... s.count {
            // print("End in: \(end)")
            for start in stride(from: end - 1, through: 0, by: -1) {
                let word = String(s[start ..< end])
                // print("---start from: \(start) with \(word)")
                if valid[start], dict.contains(word) {
                    valid[end] = true
                    break
                }
            }
        }
        return valid[s.count]
    }
}
