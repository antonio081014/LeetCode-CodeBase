/**
 * https://leetcode.com/problems/maximum-number-of-balloons/
 * 
 * 
 */ 
// Date: Mon Sep 13 23:32:17 PDT 2021
class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        let s = "balloon"
        var count: [Character : Int] = [:]
        for c in text {
            if s.contains(c) {
                count[c, default: 0] += 1
            }
        }
        var result = text.count
        for c in s {
            let key = c
            let val = count[c, default: 0]
            if key == Character("l") || key == Character("o") {
                result = min(result, val / 2)
            } else {
                result = min(result, val)
            }
        }
        return result
    }
}