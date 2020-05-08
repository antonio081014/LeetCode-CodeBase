/**
 * https://leetcode.com/problems/number-of-1-bits/
 * 
 * 
 */ 
// Date: Fri May  8 13:48:26 PDT 2020
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            count += n % 2 == 0 ? 0 : 1
            n /= 2
        }
        return count
    }
}
