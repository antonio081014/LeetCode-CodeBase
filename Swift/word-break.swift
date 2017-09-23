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
