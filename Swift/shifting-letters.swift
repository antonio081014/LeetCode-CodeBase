/**
 * https://leetcode.com/problems/shifting-letters/
 * 
 * 
 */ 
// Date: Wed Sep  8 21:47:54 PDT 2021
class Solution {
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        let s = Array(s)
        var sum = 0
        var result = ""
        for index in stride(from: s.count - 1, through: 0, by: -1) {
            sum += shifts[index]
            let a = (Int(s[index].asciiValue!) - 97 + sum) % 26 + 97
            let c = Character(Unicode.Scalar(UInt8(a)))
            result = String(c) + result
        }
        return result
    }
}