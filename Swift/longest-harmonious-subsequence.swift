/**
 * https://leetcode.com/problems/longest-harmonious-subsequence/
 * 
 * 
 */ 
// Date: Thu Feb  4 13:57:16 PST 2021
class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        var map: [Int : Int] = [:]
        for x in nums {
            map[x, default: 0] += 1
        }
        var result = 0
        for key in map.keys {
            if let x = map[key], let y = map[key + 1] {
                result = max(result, x + y)
            }
        }
        return result
    }
}