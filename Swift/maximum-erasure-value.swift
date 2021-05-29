/**
 * https://leetcode.com/problems/maximum-erasure-value/
 * 
 * 
 */ 
// Date: Fri May 28 22:36:38 PDT 2021
class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var map: [Int : Int] = [:]
        var sum = 0
        var result = 0
        var left = 0
        for right in stride(from: 0, to: nums.count, by: 1) {
            let n = nums[right]
            sum += n
            if let lastIndex = map[n] {
                while left <= lastIndex {
                    sum -= nums[left]
                    left += 1
                }
            }
            map[n] = right
            result = max(result, sum)
            // print("\(sum) - \(result)")
        }
        // print(map)
        return result
    }
}