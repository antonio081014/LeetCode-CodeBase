/**
 * https://leetcode.com/problems/minimum-flips-to-make-a-or-b-equal-to-c/
 * 
 * 
 */ 
class Solution {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var count = 0
        var a = a
        var b = b
        var c = c
        while a > 0 || b > 0 || c > 0 {
            if c % 2 == 1 {
                count += 1 - ((a % 2) | (b % 2))
            } else {
                count += (a % 2) + (b % 2)
            }
            c /= 2
            b /= 2
            a /= 2
        }
        return count
    }
}
