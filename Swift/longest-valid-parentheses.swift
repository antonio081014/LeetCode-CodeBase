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
/**
 * https://leetcode.com/problems/longest-valid-parentheses/
 * 
 * 
 */ 
// Date: Sun Apr  4 09:04:24 PDT 2021
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var invalidIndices = [Int]()
        let s = Array(s)
        for index in 0 ..< s.count {
            if String(s[index]) == "(" {
                invalidIndices.append(index)
            } else {
                if let last = invalidIndices.last, s[last] == Character("(") {
                    invalidIndices.removeLast()
                } else {
                    invalidIndices.append(index)
                }
            }
        }
        if invalidIndices.isEmpty { return s.count }
        var end = s.count
        var result = 0
        while let last = invalidIndices.last {
            result = max(result, end - last - 1)
            end = last
            invalidIndices.removeLast()
        }
        result = max(result, end)
        return result
    }
}

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var invalidIndices = [Int]()
        let s = Array(s)
        for index in 0 ..< s.count {
            if String(s[index]) == "(" {
                invalidIndices.append(index)
            } else {
                if let last = invalidIndices.last, s[last] == Character("(") {
                    invalidIndices.removeLast()
                } else {
                    invalidIndices.append(index)
                }
            }
        }
        if invalidIndices.isEmpty { return s.count }
        var end = s.count
        var result = 0
        invalidIndices = [-1] + invalidIndices
        while let last = invalidIndices.last {
            result = max(result, end - last - 1)
            end = last
            invalidIndices.removeLast()
        }
        return result
    }
}