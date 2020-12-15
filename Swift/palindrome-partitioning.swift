/**
 * https://leetcode.com/problems/palindrome-partitioning/
 * 
 * 
 */ 
// Date: Mon Dec 14 17:14:19 PST 2020
class Solution {
    func partition(_ s: String) -> [[String]] {
        let s = Array(s)
        var result = [[String]]()
        func isPalindrome(_ start: Int, _ end: Int) -> Bool {
            var left = start
            var right = end
            while left < right {
                if s[left] != s[right] { return false }
                left += 1
                right -= 1
            }
            return true
        }
        func dfs(_ start: Int, _ list: [String]) {
            if start >= s.count {
                result.append(list)
                return
            }
            for end in stride(from: start, to: s.count, by: 1) {
                if isPalindrome(start, end) {
                    dfs(end + 1, list + [String(s[start ... end])])
                }
            }

        }
        
        dfs(0, [])
        return result
    }
}

/**
 * https://leetcode.com/problems/palindrome-partitioning/
 * 
 * 
 */ 
// Date: Mon Dec 14 17:30:13 PST 2020
class Solution {
    func partition(_ s: String) -> [[String]] {
        let s = Array(s)
        var result = [[String]]()
        var isPalindrome = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        
        func dfs(_ start: Int, _ list: [String]) {
            if start >= s.count {
                result.append(list)
                return
            }
            for end in stride(from: start, to: s.count, by: 1) {
                if s[start] == s[end] && (end - start <= 2 || isPalindrome[start + 1][end - 1]) {
                    isPalindrome[start][end] = true
                    dfs(end + 1, list + [String(s[start ... end])])
                }
            }

        }
        
        dfs(0, [])
        return result
    }
}

