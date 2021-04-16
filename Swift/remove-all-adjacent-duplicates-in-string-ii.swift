/**
 * https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
 * 
 * 
 */ 
// Date: Fri Apr 16 14:11:45 PDT 2021
class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack: [(c: Character, count: Int)] = []
        for cc in s {
            if let last = stack.last, last.c == cc {
                stack.removeLast()
                stack.append((cc, last.count + 1))
            } else {
                stack.append((cc, 1))
            }
            
            while let last = stack.last, last.count == k {
                stack.removeLast()
            }
        }
        var result = ""
        for item in stack {
            var text = ""
            for _ in 0 ..< item.count {
                text.append(item.c)
            }
            result += text
        }
        return result
    }
}