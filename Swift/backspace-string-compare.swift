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
/**
 * https://leetcode.com/problems/backspace-string-compare/
 * 
 * 
 */ 
class Solution {
    /// Use two pointer to loop through two strings from end to start.
    ///
    ///
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let S = Array(S)
        let T = Array(T)
        var index1 = S.count - 1
        var index2 = T.count - 1
        var skip1 = 0
        var skip2 = 0
        while index1 >= 0 || index2 >= 0 {
            while index1 >= 0 {
                if S[index1] == "#" {
                    skip1 += 1
                    index1 -= 1
                } else if skip1 > 0 {
                    skip1 -= 1
                    index1 -= 1
                } else {
                    break
                }
            }
            
            while index2 >= 0 {
                if T[index2] == "#" {
                    skip2 += 1
                    index2 -= 1
                } else if skip2 > 0 {
                    skip2 -= 1
                    index2 -= 1
                } else {
                    break
                }
            }
            // print("\(index1) - \(index2)")
            /// Check if,
            /// 1. Both indices have not reached the start side.
            /// 2. One has reached the start, but the other one has not.
            ///
            if index1 >= 0, index2 >= 0, S[index1] != T[index2] { return false }
            else if (index1 >= 0) != (index2 >= 0) { return false }
            
            
            index1 -= 1
            index2 -= 1
        }
        return index1 < 0 && index2 < 0
    }
}
