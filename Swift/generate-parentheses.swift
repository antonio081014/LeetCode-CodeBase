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
/**
 * https://leetcode.com/problems/generate-parentheses/
 * 
 * 
 */ 
// Date: Wed Jun 16 09:55:42 PDT 2021
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = Set<String>()
        
        func dfs(_ left: Int, _ right: Int, _ combine: String) {
            if left == n, right == n {
                result.insert(combine)
                return
            }
            
            if left < n {
                dfs(left + 1, right, combine + "(")
            }
            
            if right < n, right < left {
                dfs(left, right + 1, combine + ")")
            }
        }
        
        dfs(0, 0, "")
        
        return Array(result)
    }
}