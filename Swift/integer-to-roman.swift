/**
 * 
 * Problem Link: https://leetcode.com/problems/integer-to-roman/
 *
 *
 *
 */

class Solution {
    func intToRoman(_ num: Int) -> String {
        let currency = [
            (1000, "M"),
            (900, "CM"),
            (500, "D"),
            (400, "CD"),
            (100, "C"),
            (90, "XC"),
            (50, "L"),
            (40, "XL"),
            (10, "X"),
            (9, "IX"),
            (5, "V"),
            (4, "IV"),
            (1, "I")]
        var ret = ""
        var n = num
        var index = 0
        while n > 0 && index < currency.count {
            if n >= currency[index].0 {
                ret += currency[index].1
                n -= currency[index].0
            } else {
                index += 1
            }
        }
        return ret
    }
}
