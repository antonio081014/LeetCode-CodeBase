/**
 * https://leetcode.com/problems/excel-sheet-column-number/
 * 
 * 
 */ 
// Date: Mon Aug 10 10:16:08 PDT 2020
class Solution {
    func titleToNumber(_ s: String) -> Int {
        var result = 0
        for c in s.unicodeScalars {
            result = result * 26 + Int(c.value) - 64
        }
        return result
    }
}
/**
 * https://leetcode.com/problems/excel-sheet-column-number/
 * 
 * 
 */ 
// Date: Mon Aug 10 10:18:33 PDT 2020
class Solution {
    func titleToNumber(_ s: String) -> Int {
        return s.unicodeScalars.reduce(0) { $0 * 26 + Int($1.value) - 64 }
    }
}
