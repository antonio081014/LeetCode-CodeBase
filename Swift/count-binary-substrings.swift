/**
 * https://leetcode.com/problems/count-binary-substrings/
 * 
 * 
 */ 
// Date: Fri Apr 23 14:32:53 PDT 2021
class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        var a = 0
        var b = 0
        var result = 0

        var last: Character? = nil
        for c in s {
            if let ch = last, ch != c, a > 0, b > 0 {
                result += min(a, b)
                if c == Character("1") {
                    a = 0
                } else {
                    b = 0
                }
            }

            if c == Character("1") {
                a += 1
            } else {
                b += 1
            }
            last = c
            // print("\(a) - \(b)")
        }

        if a > 0, b > 0 {
            result += min(a, b)
        }

        return result
    }
}