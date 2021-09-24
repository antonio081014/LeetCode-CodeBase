/**
 * https://leetcode.com/problems/n-th-tribonacci-number/
 * 
 * 
 */ 
// Date: Fri Sep 24 00:24:13 PDT 2021
class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        if n == 2 { return 1 }
        
        var a = 0
        var b = 1
        var c = 1
        
        for x in stride(from: 3, through: n, by: 1) {
            let next = a + b + c
            a = b
            b = c
            c = next
        }
        return c
    }
}