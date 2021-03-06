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
/**
 * https://leetcode.com/problems/plus-one/
 * 
 * 
 */ 
// Date: Sun May  3 09:58:42 PDT 2020
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var flag = 1
        var index = digits.count - 1
        var ret: [Int] = []
        
        while flag > 0 || index >= 0 {
            if index >= 0 {
                flag += digits[index]
            }
            ret.insert(flag % 10, at: 0)
            flag = flag / 10
            
            index -= 1
        }
        return ret
    }
}
/**
 * https://leetcode.com/problems/plus-one/
 * 
 * 
 */ 
// Date: Mon Jul  6 08:34:17 PDT 2020
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var offset = 1
        var result = digits
        for index in stride(from: digits.count - 1, through: 0, by: -1) {
            result[index] += offset
            offset = result[index] / 10
            result[index] %= 10
        }
        if offset > 0 {
            result.insert(offset, at: 0)
        }
        return result
    }
}
