/**
 * https://leetcode.com/problems/check-array-formation-through-concatenation/
 * 
 * 
 */ 
// Date: Sat Jan  2 20:30:00 PST 2021

class Solution {
    func canFormArray(_ arr: [Int], _ pieces: [[Int]]) -> Bool {
        var dict: [Int : [Int]] = [:]
        for x in pieces {
            dict[x[0]] = x
        }
        var result = [Int]()
        for x in arr {
            result += dict[x, default: []]
        }
        return result == arr
    }
}