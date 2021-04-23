/**
 * https://leetcode.com/problems/brick-wall/
 * 
 * 
 */ 
// Date: Thu Apr 22 21:30:24 PDT 2021
class Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var count: [Int : Int] = [:]
        for row in wall {
            var index = 0
            for brick in row.dropLast() {
                index += brick
                count[index, default: 0] += 1
            }
        }
        var result = wall.count
        for num in count.values {
            result = min(result, wall.count - num)
        }
        return result
    }
}