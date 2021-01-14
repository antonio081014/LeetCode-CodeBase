/**
 * https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/
 * 
 * 
 */ 
// Date: Thu Jan 14 11:27:10 PST 2021
class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var leftSum = [0 : 0]
        var sum = 0
        for index in 0 ..< nums.count {
            sum += nums[index]
            if leftSum[sum] == nil {
                leftSum[sum] = index + 1
            }
        }
        sum = 0
        var minStep = leftSum[x, default: Int.max]
        for index in stride(from: nums.count - 1, through: 0, by: -1) {
            sum += nums[index]
            if let left = leftSum[x - sum], index >= left {
                minStep = min(minStep, left + nums.count - index)
            }
        }
        
        
        return minStep == Int.max ? -1 : minStep
    }
}