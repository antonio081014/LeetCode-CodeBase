/**
 * https://leetcode.com/problems/minimum-window-substring/
 * 
 * 
 */ 
// Date: Tue Aug 17 15:14:22 PDT 2021
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let s = Array(s)
        var tDict: [Character : Int] = [:]
        for c in t {
            tDict[c, default: 0] += 1
        }
        let keys = tDict.keys.count
        var left = 0
        var right = 0
        var minLen: (start: Int, end: Int) = (0, s.count)
        var formed = 0
        var sDict = [Character : Int]()
        while right < s.count {
            sDict[s[right], default: 0] += 1
            if tDict[s[right]] != nil, tDict[s[right], default: 0] == sDict[s[right], default: 0] {
                formed += 1
            }

            while left <= right, formed == keys {
                if (right - left) < (minLen.end - minLen.start) {
                    minLen = (left, right)
                }
                let c = s[left]
                sDict[c, default: 0] -= 1
                left += 1
                if tDict[c] != nil, tDict[c, default: 0] > sDict[c, default: 0] {
                    formed -= 1
                }
            }
            right += 1
        }
        if minLen.end == s.count { return "" }
        return String(s[minLen.start ... minLen.end])
    }
}

