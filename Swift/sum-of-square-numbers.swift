/**
 * https://leetcode.com/problems/sum-of-square-numbers/
 * 
 * 
 */ 
// Date: Wed Aug 25 08:57:11 PDT 2021
class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        if c <= 1 { return true }
        for a in 1 ... Int(sqrt(Double(c))) {
            if c < a * a { continue }
            let b = Int(sqrt(Double(c - a * a)))
            if a * a + b * b == c { return true }
        }
        return false
    }
}