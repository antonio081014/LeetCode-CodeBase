/**
 * https://leetcode.com/problems/word-break-ii/
 * 
 * 
 */ 
// Date: Thu Jul 30 11:10:43 PDT 2020
class Solution {
    private func wordBreakable(_ s: String, _ wordDict: [String]) -> Bool {
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
    /// - Complexity:
    ///     - Time: O(n^2), n is the length of string s.
    ///     - Space: O(n^3), n is the length of string s.
    ///
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        if wordBreakable(s, wordDict) == false { return [] }
        let dict = Set(wordDict)
        let s = Array(s)
        var valid = Array(repeating: [String](), count: s.count + 1)
        valid[0] = [""]
        for end in 1 ... s.count {
            // print("End in: \(end)")
            for word in dict {
                if word.count <= end {
                    let start = end - word.count
                    // print("---start: \(start) with: \(word)")
                    if String(s[start ..< end]) == word, valid[start].isEmpty == false {
                        for cand in valid[start] {
                            valid[end].append(cand + word + " ")
                        }
                    }
                }
            }
        }
        return valid[s.count].map { $0.trimmingCharacters(in: .whitespaces) }
    }
}
