/**
 * Problem Link: https://leetcode.com/problems/generate-parentheses/
 */
class Solution {
    var pSet: Set<String>!
    func generateParenthesis(_ n: Int) -> [String] {
        pSet = Set<String>()
        generate(n, n, "")
        return Array(pSet)
    }
    
    private func generate(_ left: Int, _ right: Int, _ s: String) {
        if left == 0 && right == 0 {
            pSet.insert(s)
            return
        }
        if left == right {
            generate(left-1, right, s + "(")
        } else {
            if left > 0 {
                generate(left-1, right, s + "(")
            }
            if right > 0 {
                generate(left, right-1, s + ")")
            }
        }
    }
}
