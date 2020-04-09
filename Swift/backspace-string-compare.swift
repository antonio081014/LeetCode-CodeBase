/**
 * https://leetcode.com/problems/backspace-string-compare/
 * 
 * 
 */ 
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        return self.compress(S) == self.compress(T)
    }
    
    fileprivate func compress(_ text: String) -> String {
        var a = ""
        for c in text {
            if String(c) == "#" {
                if a.count > 0 {
                    a.removeLast()
                }
            } else {
                a += String(c)
            }
        }
        return a
    }
}
