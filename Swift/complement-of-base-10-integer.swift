/**
 * https://leetcode.com/problems/complement-of-base-10-integer/
 * 
 * 
 */ 
// Date: Mon May  4 09:00:03 PDT 2020
class Solution {
    func bitwiseComplement(_ num: Int) -> Int {
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
