/**
 * https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/
 * 
 * 
 */ 
// Date: Fri Feb 12 13:31:46 PST 2021
class Solution {
    func numberOfSteps (_ num: Int) -> Int {
        var num = num
        var result = 0
        while num > 0 {
            num = num % 2 == 0 ? num / 2 : num - 1
            result += 1
        }
        return result
    }
}


class Solution {
    func numberOfSteps (_ num: Int) -> Int {
        return max(0, num.bitWidth - num.leadingZeroBitCount + num.nonzeroBitCount - 1)
    }
}

class Solution {
    func numberOfSteps (_ num: Int) -> Int {
        if num < 2 { return num }
        return numberOfSteps(num / 2) + 1 + num % 2
    }
}