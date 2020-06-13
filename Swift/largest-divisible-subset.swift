/**
 * https://leetcode.com/problems/largest-divisible-subset/
 * 
 * 
 */ 
// Date: Sat Jun 13 10:10:37 PDT 2020
class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        var count = Array(repeating: 1, count: nums.count)
        var pre = Array(repeating: -1, count: nums.count)
        let nums = nums.sorted()
        var maxLengthSolutionIndex = 0
        for index in 0 ..< nums.count {
            var subIndex = index - 1
            while subIndex >= 0 {
                if nums[index] % nums[subIndex] == 0, count[index] < count[subIndex] + 1 {
                    count[index] = count[subIndex] + 1
                    pre[index] = subIndex
                }
                subIndex -= 1
            }
            if count[index] > count[maxLengthSolutionIndex] {
                maxLengthSolutionIndex = index
            }
        }
        var solution: [Int] = []
        while maxLengthSolutionIndex >= 0 {
            solution.insert(nums[maxLengthSolutionIndex], at: 0)
            maxLengthSolutionIndex = pre[maxLengthSolutionIndex]
        }
        return solution
    }
}
