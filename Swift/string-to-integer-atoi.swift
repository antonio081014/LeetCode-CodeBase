// This is a take away code.
// Original post: https://leetcode.com/problems/string-to-integer-atoi/discuss/1698567/Swift
class Solution {
    func myAtoi(_ s: String) -> Int {
        var result = 0
        var sign = 1
        var isStarted = false
        for char in s {
            if char == " " {
                if isStarted {
                    break
                }
            } else if (char == "-" || char == "+") {
                if isStarted {
                    break
                }
                isStarted = true
                if char == "-" {
                   sign = -1 
                }
            } else if char >= "0" && char <= "9" {
                isStarted = true
                if let val = char.wholeNumberValue {
                    result = result*10+val
                }
                if result > Int32.max {
                    return sign == 1 ? Int(Int32.max) : Int(Int32.min)
                }
            } else {
                break
            }
        }
        return result*sign
    }
}
