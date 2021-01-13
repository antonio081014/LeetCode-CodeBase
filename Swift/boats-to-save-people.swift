/**
 * https://leetcode.com/problems/boats-to-save-people/
 * 
 * 
 */ 
// Date: Wed Jan 13 09:32:10 PST 2021
class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let p = people.sorted()
        var left = 0
        var right = p.count - 1
        var result = 0
        while left <= right {
            result += 1
            if p[left] + p[right] <= limit {
                left += 1
            }
            right -= 1
        }
        return result
    }
}