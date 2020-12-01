/**
 * https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/
 * 
 * 
 */ 
// Date: Mon Nov 30 17:31:01 PST 2020
class Solution {
    /// Divide and Conque.
    /// - Complexity:
    ///     - Time: O(n^2)
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        func longest(_ start: Int, _ end: Int) -> Int {
            if end - start + 1 < k { return 0 }
            var countmap: [Character : Int] = [:]
            for index in start ... end {
                countmap[s[index]] = 1 + countmap[s[index], default: 0]
            }
            for index in (start) ... end {
                if countmap[s[index], default: 0] < k {
                    var next = index + 1
                    while next < end, countmap[s[next], default: 0] < k { next += 1 }
                    return max(longest(start, index - 1), longest(next, end))
                }
            }
            return end - start + 1
        }

        return longest(0, s.count - 1)
    }
}