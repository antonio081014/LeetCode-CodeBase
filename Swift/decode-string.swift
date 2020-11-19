/**
 * https://leetcode.com/problems/decode-string/
 * 
 * 
 */ 
// Date: Thu Nov 19 09:33:04 PST 2020
class Solution {
    func decodeString(_ s: String) -> String {
        var num = 0
        var text = ""
        var stack1 = [Int]()
        var stack2 = [String]()
        for c in s {
            if "[" == String(c) {
                stack1.append(num)
                stack2.append(text)
                num = 0
                text = ""
            } else if "]" == String(c) {
                text = stack2.removeLast() + Array(repeating: text, count: stack1.removeLast()).joined()
            } else if "0123456789".contains(c) {
                num = num * 10 + Int(String(c))!
            } else {
                text += String(c)
            }
        }
        return text
    }
}