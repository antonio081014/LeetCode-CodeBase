/**
 * https://leetcode.com/problems/reverse-string/
 * 
 * 
 */ 
// Date: Sun May  3 15:27:06 PDT 2020
class Solution {
    func reverseString(_ s: inout [Character]) {
        var start = 0
        var end = s.count - 1
        while start < end {
            s.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}
