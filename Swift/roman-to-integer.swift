/**
 * Problem Link: https://leetcode.com/problems/roman-to-integer/
 *
 *
 */
class Solution {
    func romanToInt(_ s: String) -> Int {
        let currency = [
            "M" : 1000,
            "CM" : 900,
            "D" : 500,
            "CD" : 400,
            "C" : 100,
            "XC" : 90,
            "L" : 50,
            "XL" : 40,
            "X" : 10,
            "IX" : 9,
            "V" : 5,
            "IV" : 4,
            "I" : 1]
        let list = s.characters.map() {"\($0)"}
        var num = 0
        var i = 0
        while i < list.count {
            if i + 1 < list.count, let x = currency[list[i]], let y = currency[list[i+1]], x < y {
                num += currency[list[i] + list[i+1]]!
                i += 2
            } else {
                num += currency[list[i]]!
                i += 1
            }
        }
        return num
    }
}
