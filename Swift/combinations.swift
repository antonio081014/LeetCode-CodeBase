/**
 * https://leetcode.com/problems/combinations/
 * 
 * 
 */ 
// Date: Thu Jun 18 11:14:48 PDT 2020
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var solution: [[Int]] = []
        
        func choose(from nums: [Int], _ start: Int, _ left: Int, _ result: inout [Int]) {
            if left == 0 {
                solution.append(result)
                return
            }
            for index in start ..< nums.count {
                result.append(nums[index])
                choose(from: nums, index + 1, left - 1, &result)
                result.removeLast()
            }
        }
        
        var result: [Int] = []
        choose(from: Array((1...n)), 0, k, &result)
        return solution
    }
}
