/**
 * https://leetcode.com/problems/score-of-parentheses/
 * 
 * 
 */ 
// Date: Wed Feb 24 10:46:08 PST 2021
class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        var stack: [Int] = [0]
        for c in S {
            if String(c) == "(" {
                stack.append(0)
            } else {
                let last = stack.removeLast()
                let score = stack.removeLast() + max(2 * last, 1)
                stack.append(score)
            }
        }
        return stack.removeLast()
    }
}

