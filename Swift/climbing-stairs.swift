/**
 * https://leetcode.com/problems/climbing-stairs/
 * 
 * 
 */ 
// Date: Thu May  7 09:48:06 PDT 2020
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var zero = 1
        var one = 1
        var step = 2
        while step <= n {
            let tmp = zero + one
            zero = one
            one = tmp
            step += 1
        }
        return one
    }
}
