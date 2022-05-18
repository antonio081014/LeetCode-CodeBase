class Solution {
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        var result = 0
        var sign = 1
        var number = 0
        for c in s {
            if c.isNumber {
                number = number * 10 + Int(String(c))!
            } else if "+" == String(c) {
                result += number * sign
                number = 0
                sign = 1
            } else if "-" == String(c) {
                result += number * sign
                number = 0
                sign = -1
            } else if "(" == String(c) {
                stack.append(result)
                stack.append(sign)
                result = 0
                sign = 1
                // number should be 0 here
            } else if ")" == String(c) {
                result += number * sign
                number = 0
                // -(1+2)
                sign = stack.removeLast()
                result *= sign
                result += stack.removeLast()
                sign = 1
            }
        }
        if number > 0 {
            result += number * sign
        }
        return result
    }
}
