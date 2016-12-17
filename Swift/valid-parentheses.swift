/**
 * Problem Link: https://leetcode.com/problems/valid-parentheses/
 *
 *
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        let slist = s.characters.map({String($0)})
        var stack = [String]()
        for c in slist {
            if c == "(" || c == "[" || c == "{" {
                stack += [c]
            } else {
                if stack.isEmpty {
                    return false
                }
                switch c {
                case ")":
                    if stack.last! == "(" {
                        stack.popLast()
                    } else {
                        return false
                    }
                case "]":
                    if stack.last! == "[" {
                        stack.popLast()
                    } else {
                        return false
                    }
                case "}":
                    if stack.last! == "{" {
                        stack.popLast()
                    } else {
                        return false
                    }
                default:
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
