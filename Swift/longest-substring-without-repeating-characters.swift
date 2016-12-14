/**
 * Problem Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/
 *
 * In Swift Language, String doesnt have a native support for subscript. So we convert the String to an Array of String, where each String contains a single character. This will save tons of time, since String manipulation is very expensive operation.
 * 
 * String.characters.count will take Linear time.
 *
 */

class Solution {
    func lengthOfLongestSubstring(_ ss: String) -> Int {
        let s = ss.characters.map({String($0)})
        if s.count == 0 {
            return 0
        }
        
        var dict = [String : Int]()
        var maxl = 0
        var start = 0
        
        for (i, c) in s.enumerated() {
            if let x = dict[c] {
                maxl = max(maxl, i - start)
                for j in start..<i {
                    if s[j] == c {
                        start = j + 1
                        break
                    }
                    dict[s[j]] = nil
                }
            } else {
                dict[c] = i
            }
        }
        maxl = max(maxl, s.count - start)
        return maxl
    }
}
