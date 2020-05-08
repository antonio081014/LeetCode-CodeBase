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
/**
 * https://leetcode.com/problems/valid-parentheses/
 * 
 * 
 */ 
// Date: Fri May  8 14:02:50 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the length of s
    ///     - Space: O(n), n is the length of s
    ///
    func isValid(_ s: String) -> Bool {
        var stack: [String] = []
        for c in s {
            let x = String(c)
            if stack.isEmpty {
                stack.append(x)
            } else if let last = stack.last {
                let combo = last + x
                if combo == "[]" || combo == "{}" || combo == "()" {
                    stack.removeLast()
                } else {
                    stack.append(x)
                }
            }
        }
        return stack.isEmpty
    }
}
