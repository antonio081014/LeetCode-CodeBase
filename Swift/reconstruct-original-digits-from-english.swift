/**
 * https://leetcode.com/problems/reconstruct-original-digits-from-english/
 * 
 * 
 */ 
// Date: Sun Mar 28 09:50:24 PDT 2021
class Solution {
    func originalDigits(_ s: String) -> String {
        var count: [Character : Int] = [:]
        for c in s {
            count[c, default: 0] += 1
        }
        
        var result: [Int] = []
        if let v = count[Character("g")] {
            result += Array(repeating: 8, count: v)
            for c in "eight" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("z")] {
            result += Array(repeating: 0, count: v)
            for c in "zero" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("x")] {
            result += Array(repeating: 6, count: v)
            for c in "six" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("w")] {
            result += Array(repeating: 2, count: v)
            for c in "two" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("h")] {
            result += Array(repeating: 3, count: v)
            for c in "three" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("s")] {
            result += Array(repeating: 7, count: v)
            for c in "seven" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("u")] {
            result += Array(repeating: 4, count: v)
            for c in "four" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("v")] {
            result += Array(repeating: 5, count: v)
            for c in "five" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("o")] {
            result += Array(repeating: 1, count: v)
            for c in "one" {
                count[c, default: 0] -= v
            }
        }
        
        if let v = count[Character("i")] {
            result += Array(repeating: 9, count: v)
            for c in "nine" {
                count[c, default: 0] -= v
            }
        }
        result.sort()
        return result.map { String($0) }.joined()
    }
}