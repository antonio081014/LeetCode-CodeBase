/**
 * https://leetcode.com/problems/evaluate-reverse-polish-notation/
 * 
 * 
 */ 
// Date: Tue May 25 21:04:01 PDT 2021
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var eval = [Int]()
        for tok in tokens {
            if "+-*/".contains(tok) {
                let right = eval.removeLast()
                let left = eval.removeLast()
                switch tok {
                    case "+":
                        eval.append(left + right)
                    case "-":
                        eval.append(left - right)
                    case "*":
                        eval.append(left * right)
                    case "/":
                        eval.append(left / right)
                    default: 
                        break
                }
            } else {
                eval.append(Int(tok) ?? 0)
            }
        }
        return eval.last ?? 0
    }
}