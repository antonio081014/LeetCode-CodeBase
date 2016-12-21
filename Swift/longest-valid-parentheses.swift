/**
 * https://leetcode.com/problems/longest-valid-parentheses/
 * 
 * 
 */ 
class Solution {
    
    func longestValidParentheses(_ s: String) -> Int {
        let sList = s.characters.map({"\($0)"})
        let n = sList.count
        if n == 0 {
            return 0
        }
        var mark = Array(repeating: 0, count: n + 1)
        var maxL = 0
        for i in 1...n {
            if sList[i - 1] == ")" {
                let j = i - 1 - mark[i-1]
                if j>=1, sList[j-1]=="(" {
                    mark[i] = mark[j-1] + mark[i-1] + 2
                }
            }
            maxL = max(maxL, mark[i])
        }
        return maxL
    }
}
