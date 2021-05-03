/**
 * https://leetcode.com/problems/running-sum-of-1d-array/
 * 
 * 
 */ 
// Date: Mon May  3 13:10:40 PDT 2021
class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        var result: [Int] = []
        for n in nums {
            sum += n
            result.append(sum)
        }
        return result
    }
}