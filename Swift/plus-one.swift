/**
 * https://leetcode.com/problems/plus-one/
 * 
 * 
 */ 
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        let n = digits.count
        var flag = 1
        var resDigits = digits
        for i in 0..<resDigits.count {
            resDigits[n-i-1] += flag
            flag = 0
            if resDigits[n-i-1] >= 10 {
                flag = 1
                resDigits[n-i-1] %= 10
            }
        }
        if flag > 0 {
            resDigits = [1] + resDigits
        }
        return resDigits
    }
}
