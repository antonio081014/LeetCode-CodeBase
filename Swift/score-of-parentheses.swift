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

/**
 * https://leetcode.com/problems/score-of-parentheses/
 * 
 * 
 */ 
// Date: Wed Feb 24 10:50:53 PST 2021
class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        var depth = 0
        var result = 0
        let S = Array(S)
        for index in 0 ..< S.count {
            if S[index] == Character("(") {
                depth += 1
            } else {
                depth -= 1
                if S[index - 1] == Character("(") {
                    result += 1 << depth
                }
            }
        }
        return result
    }
}