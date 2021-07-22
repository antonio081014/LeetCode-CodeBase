/**
 * https://leetcode.com/problems/partition-array-into-disjoint-intervals/
 * 
 * 
 */ 
// Date: Thu Jul 22 10:43:52 PDT 2021
class Solution {
    func partitionDisjoint(_ nums: [Int]) -> Int {
        let n = nums.count
        var maxList = Array(repeating: Int.min, count: n)
        var minList = Array(repeating: Int.max, count: n)
        
        var maxV = Int.min
        for index in 0 ..< n {
            maxV = max(maxV, nums[index])
            maxList[index] = maxV
        }
        //print(maxList)
        var minV = Int.max
        for index in stride(from: n - 1, to: 0, by: -1) {
            minV = min(minV, nums[index])
            minList[index] = minV
        }
        
        for index in 1 ..< n {
            if maxList[index - 1] <= minList[index] {
                return index
            }
        }
        //print(minList)
        return -1
    }
}