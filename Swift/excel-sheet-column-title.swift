/**
 * https://leetcode.com/problems/excel-sheet-column-title/
 * 
 * 
 */ 
class Solution {
    func convertToTitle(_ n: Int) -> String {
        var num = n
        var colString = ""
        while num > 0 {
            let x = (num-1) % 26
            num = (num-1)/26
            colString = String(stringInterpolationSegment: UnicodeScalar(x + 65)!) + colString
        }
        return colString
    }
}
/**
 * https://leetcode.com/problems/excel-sheet-column-title/
 * 
 * 
 */ 
// Date: Mon Aug 10 10:51:52 PDT 2020
class Solution {
    func convertToTitle(_ n: Int) -> String {
        var result = ""
        var n = n
        while n > 0 {
            let code = Unicode.Scalar(UInt8(n % 26 == 0 ? 26 : n % 26) + 64)
            // print("\(n % 26 + 64) : \(code)")
            result = String(Character(code)) + result
            n -= Int(code.value) - 64
            n /= 26
        }
        return result
    }
}
