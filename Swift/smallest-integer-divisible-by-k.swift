/**
 * https://leetcode.com/problems/smallest-integer-divisible-by-k/
 * 
 * 
 */ 
// Date: Wed Nov 25 10:54:40 PST 2020
class Solution {
    func smallestRepunitDivByK(_ K: Int) -> Int {
        if K % 2 == 0 { return -1 }
        var len = 1
        var num = 1
        while num % K != 0 {
            len += 1
            num = (num * 10 + 1) % K
            if len > K { return -1 }
        }
        return len
    }
}