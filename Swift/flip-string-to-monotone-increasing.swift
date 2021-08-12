/**
 * https://leetcode.com/problems/flip-string-to-monotone-increasing/
 * 
 * 
 */ 
// Date: Wed Aug 11 17:12:14 PDT 2021
class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        let len = s.count
        var count = Array(repeating: 0, count: len + 1)
        for (index, c) in s.enumerated() {
            let n = c == Character("0") ? 0 : 1
            count[index + 1] = count[index] + n
        }
        var result = Int.max
        for index in 0 ... len {
            result = min(result, count[index] + len - index - count[len] + count[index])
        }
        return result
    }
}