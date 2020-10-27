/**
 * https://leetcode.com/problems/remove-duplicate-letters/
 * 
 * 
 */ 
// Date: Tue Oct 27 10:55:32 PDT 2020
class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var count: [Character : Int] = [:]
        for c in s {
            count[c] = count[c, default: 0] + 1
        }
        var visited: Set<Character> = []
        var resultStack: [Character] = []
        for c in s {
            count[c] = count[c, default: 0] - 1
            if visited.contains(c) { continue }
            while let last = resultStack.last {
                if c < last, count[last, default: 0] > 0 {
                    resultStack.removeLast()
                    visited.remove(last)
                } else { break }
            }
            resultStack.append(c)
            visited.insert(c)
        }
        return String(resultStack)
    }
}