/**
 * https://leetcode.com/problems/longest-word-in-dictionary-through-deleting/
 * 
 * 
 */ 
// Date: Mon Feb 22 09:49:12 PST 2021
class Solution {
    /// Sorting, then comparing.
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        let d = d.sorted { $0.count == $1.count ? $0 < $1 : $0.count > $1.count }
        let s = Array(s)

        for text in d {
            var sindex = 0
            var dindex = 0
            let text = Array(text)
            while sindex < s.count, dindex < text.count {
                if text[dindex] == s[sindex] {
                    dindex += 1
                }
                sindex += 1
            }
            if dindex == text.count { return String(text) }
        }
        return ""
    }
}

class Solution {
    /// Comparing directly.
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        let s = Array(s)
        var result = ""
        for text in d {
            var sindex = 0
            var dindex = 0
            let text = Array(text)
            while sindex < s.count, dindex < text.count {
                if text[dindex] == s[sindex] {
                    dindex += 1
                }
                sindex += 1
            }
            if dindex == text.count { 
                let substring = String(text)
                if substring.count > result.count || (substring.count == result.count && substring < result) {
                    result = substring
                }
            }
        }
        return result
    }
}

/// Refactor.
class Solution {
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        var result = ""
        let s = Array(s)
        for text in d {
            if isSubstring(s, text) {
                if text.count > result.count || (text.count == result.count && text < result) {
                    result = text
                }
            }
        }
        return result
    }

    private func isSubstring(_ main: [Character], _ sub: String) -> Bool {
        var mindex = 0
        var sindex = 0
        let sList = Array(sub)
        while mindex < main.count, sindex < sList.count {
            if main[mindex] == sList[sindex] {
                sindex += 1
            }
            mindex += 1
        }
        return sindex == sList.count
    }
}