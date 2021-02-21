/**
 * https://leetcode.com/problems/broken-calculator/
 * 
 * 
 */ 
// Date: Sun Feb 21 13:55:30 PST 2021
class Solution {
    func brokenCalc(_ X: Int, _ Y: Int) -> Int {
        var steps = 0
        var y = Y
        while X < y {
            steps += 1
            y = y % 2 == 0 ? y / 2 : y + 1
        }
        return steps + X - y
    }
}