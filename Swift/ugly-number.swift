/**
 * https://leetcode.com/problems/ugly-number/
 * 
 * 
 */ 
class Solution {
    func isUgly(_ num: Int) -> Bool {
        var num = num
        while num > 1, num % 2 == 0 { num /= 2 }
        while num > 1, num % 3 == 0 { num /= 3 }
        while num > 1, num % 5 == 0 { num /= 5 }
        return num == 1
    }
}
