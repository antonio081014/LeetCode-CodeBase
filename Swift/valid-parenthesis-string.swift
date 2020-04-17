/**
 * https://leetcode.com/problems/valid-parenthesis-string/
 * 
 * 
 */ 
///
/// Let dp[start][end] be true if and only if the interval s[start], s[start+1], ..., s[end] can be made valid.
///
class Solution {
    func checkValidString(_ s: String) -> Bool {
        if s.isEmpty { return true }
        
        let n = s.count
        var s = Array(s)
        var isValid = Array(repeating: Array(repeating: false, count: n), count: n)
        
        for index in 0 ..< n {
            if s[index] == "*" {
                isValid[index][index] = true
            }
        }
        
        if n < 2 {
            return isValid[0][n - 1]
        }
        for size in 2 ... n {
            for start in 0 ... (n - size) {
                let end = start + size - 1
                if s[start] == "*", isValid[start + 1][end] {
                    isValid[start][end] = true
                } else if s[start] == "(" || s[start] == "*" {
                    if s[end] == ")" || s[end] == "*" {
                        isValid[start][end] = (start + 1 > end - 1) ? true : isValid[start + 1][end - 1]
                        if isValid[start][end] { continue }
                    }
                    for mid in start + 1 ..< end {
                        if s[mid] == ")" || s[mid] == "*" {
                            isValid[start][end] = (mid == start + 1) ? isValid[mid + 1][end] : (isValid[start + 1][mid - 1] && isValid[mid + 1][end])
                            if isValid[start][end] { break }
                        }
                    }
                }
            }
        }
        print("\(isValid)")
        
        return isValid[0][n - 1]
    }
    
    
}
