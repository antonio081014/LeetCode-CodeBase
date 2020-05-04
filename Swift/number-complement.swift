/**
 * https://leetcode.com/problems/number-complement/
 * 
 * 
 */ 
// Date: Mon May  4 08:59:44 PDT 2020
class Solution {
    func findComplement(_ num: Int) -> Int {
        if num == 0 { return 1 }
        var ret = 0
        var num = num
        var bit = 0
        while num > 0 {
            if num % 2 == 0 {
                ret += (1 << bit)
            }
            num /= 2
            bit += 1
        }
        return ret
    }
}
