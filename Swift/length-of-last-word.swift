/**
 * Problem Link: https://leetcode.com/problems/length-of-last-word/
 *
 *
 *
 */

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var len = 0
        let rev = String(s.trimmingCharacters(in: .whitespacesAndNewlines).characters.reversed())
        for c in rev.characters {
            if String(c) == " " {
                return len
            } else {
                len += 1
            }
        }
        return len
    }
}
