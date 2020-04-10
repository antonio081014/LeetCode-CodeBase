/**
 * https://leetcode.com/problems/power-of-four/
 * 
 * 
 */ 
class Solution {
    func isPowerOfFour2(_ num: Int) -> Bool {
        if num <= 0 { return false }
        var n = num
        while n > 1 {
            if n % 4 != 0 { return false}
            n /= 4
        }
        return true
    }
    
    // The first & check if num is power of 2.
    // But I can't get the second part.
    func isPowerOfFour(_ num: Int) -> Bool {
        return ((num & (num-1)) == 0) && ((num-1) % 3 == 0)
    }
}
/**
 * https://leetcode.com/problems/power-of-four/
 * 
 * 
 */ 
class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        var n = num
        while n > 1 {
            if n % 4 != 0 { return false }
            n /= 4
        }
        return n == 1
    }
}

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        let mask = 0b01010101010101010101010101010101
        return num>0 && (num&(num - 1)) == 0 && (num | mask) == mask
    }
}
