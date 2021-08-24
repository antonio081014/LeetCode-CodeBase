/**
 * https://leetcode.com/problems/complex-number-multiplication/
 * 
 * 
 */ 
// Date: Tue Aug 24 09:33:43 PDT 2021
class Solution {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        func split(_ text: String) -> (Int, Int)? {
            let comp = text.split(separator: Character("+"))
            guard let anum = comp.first, let a = Int(anum) else { return nil }
            guard let bnum = comp.last?.dropLast(), let b = Int(bnum) else { return nil }
            return (a, b)
        }

        guard let (a, b) = split(num1), let (c, d) = split(num2) else { return "" }
        return "\(a * c - b * d)+\(b * c + a * d)i"
    }
}