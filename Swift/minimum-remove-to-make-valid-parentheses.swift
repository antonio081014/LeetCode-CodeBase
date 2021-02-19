/**
 * https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
 * 
 * 
 */ 
// Date: Fri Feb 19 10:54:26 PST 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(n)
    ///     - Space: O(n)
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack: [Int] = []
        var s = Array(s)
        for index in 0 ..< s.count {
            switch String(s[index]) {
                case "(":
                    stack.append(index)
                case ")":
                    if let lastIndex = stack.last, String(s[lastIndex]) == "(" {
                        stack.removeLast()
                    } else {
                        stack.append(index)
                    }
                default:
                    break
            }
        }
        while let last = stack.popLast() {
            s.remove(at: last)
        }
        return String(s)
    }
}