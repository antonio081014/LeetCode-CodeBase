/**
 * https://leetcode.com/problems/a-number-after-a-double-reversal/
 * 
 * 
 */ 
// Date: Fri Jan 21 19:43:50 PST 2022
class Solution {
    func isSameAfterReversals(_ num: Int) -> Bool {
        return num == 0 || num % 10 != 0 
    }
}