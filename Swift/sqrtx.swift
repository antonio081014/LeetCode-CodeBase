/**
 * https://leetcode.com/problems/sqrtx/
 * 
 * 
 */ 
class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 1 { return 1 }
        var left = 1
        var right = x
        while left < right {
            let mid = left + (right - left) / 2
            if mid * mid > x {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left - 1
    }
}/**
 * https://leetcode.com/problems/sqrtx/
 * 
 * 
 */ 
// Date: Thu Jul  9 11:59:43 PDT 2020
class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 1
        var right = x + 1
        while left < right {
            let mid = left + (right - left) / 2
            if mid * mid >= x {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left * left == x ? left : left - 1
    }
}

class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 1
        var right = x + 1
        while left < right {
            let mid = left + (right - left) / 2
            if mid * mid > x {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left - 1
    }
}
