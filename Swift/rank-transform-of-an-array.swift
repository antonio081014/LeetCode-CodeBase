/**
 * https://leetcode.com/problems/rank-transform-of-an-array/
 * 
 * 
 */ 
// Date: Mon Aug  9 16:53:13 PDT 2021
class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let sorted = arr.sorted()
        var map: [Int : Int] = [:]
        var rank = 1
        for n in sorted {
            if map[n] == nil {
                map[n] = rank
                rank += 1
            }
        }
        
        var result = [Int]()
        for n in arr {
            result.append(map[n, default: -1])
        }
        return result
    }
}