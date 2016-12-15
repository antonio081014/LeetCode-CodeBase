/**
 * Problem Link: https://leetcode.com/problems/palindrome-number/
 *
 *
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x != 0 && x % 10 == 0) {
            return false
        }
        var xx = x
        var yy = 0
        while (xx > yy) {
            let c = xx % 10
            yy = yy * 10 + c
            xx /= 10
        }
        return xx == yy || (xx == yy / 10)
    }
}
