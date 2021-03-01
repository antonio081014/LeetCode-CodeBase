/**
 * https://leetcode.com/problems/distribute-candies/
 * 
 * 
 */ 
// Date: Mon Mar  1 11:31:09 PST 2021
class Solution {
    func distributeCandies(_ candyType: [Int]) -> Int {
        var count: [Int : Int] = [:]
        for candy in candyType {
            count[candy, default: 0] += 1
        }
        return min(count.keys.count, candyType.count / 2)
    }
}

