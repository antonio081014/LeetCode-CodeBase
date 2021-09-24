/**
 * https://leetcode.com/problems/break-a-palindrome/
 * 
 * 
 */ 
// Date: Thu Sep 23 23:39:59 PDT 2021
class Solution {
    func breakPalindrome(_ palindrome: String) -> String {
        guard palindrome.count > 1 else { return "" }
        var p = Array(palindrome)
        for index in 0 ..< p.count {
            if p[index] != Character("a") {
                let c = p[index]
                p[index] = Character("a")
                if Set(p).count > 1 { return String(p) }
                p[index] = c
                p[p.count - 1] = Character("b")
                return String(p)
            }
        }
        p[p.count - 1] = Character("b")
        return String(p)
    }
}