/**
 * https://leetcode.com/problems/basic-calculator-ii/
 * 
 * 
 */ 
// Date: Tue Nov 24 09:47:35 PST 2020
class Solution {
    func calculate(_ s: String) -> Int {

        let s = Array(s).map { String($0) }

        func calc(_ start: Int, _ end: Int) -> Int {
            for index in stride(from: end, through: start, by: -1) {
                if s[index] == "+" {
                    return calc(start, index - 1) + calc(index + 1, end)
                }
                if s[index] == "-" {
                    return calc(start, index - 1) - calc(index + 1, end)
                }
            }
            for index in stride(from: end, through: start, by: -1) {
                if s[index] == "*" {
                    return calc(start, index - 1) * calc(index + 1, end)
                }
                if s[index] == "/" {
                    return calc(start, index - 1) / calc(index + 1, end)
                }
            }
            var num = ""
            for c in stride(from: start, through: end, by: 1) {
                if s[c] == " " {
                    continue
                }
                num += s[c]
            }
            return Int(num)!
        }
        return calc(0, s.count - 1)
    }
}