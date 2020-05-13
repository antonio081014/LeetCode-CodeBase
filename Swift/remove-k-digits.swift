/**
 * https://leetcode.com/problems/remove-k-digits/
 * 
 * 
 */ 
// Date: Wed May 13 09:29:38 PDT 2020
class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k == num.count { return "0" }
        var stack = [Character]()
        var k = k
        for c in num {
            while k > 0, let last = stack.last, last > c {
                stack.removeLast()
                k -= 1
            }
            stack.append(c)
        }
        
        // Case: 1122, k = 2
        while k > 0 {
            stack.removeLast()
            k -= 1
        }
        
        // Case: 10000, k = 1
        while let first = stack.first, "0" == String(first) {
            stack.removeFirst()
        }
        return stack.isEmpty ? "0" : String(stack)
    }
}
