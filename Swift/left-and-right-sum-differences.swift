/**
 * https://leetcode.com/problems/left-and-right-sum-differences/
 * 
 * 
 */ 
// Date: Sun Feb 26 11:27:54 PST 2023
class Solution {
    func leftRigthDifference(_ nums: [Int]) -> [Int] {
        let sum = nums.reduce(0) { $0 + $1 }
        var leftSum = 0
        var result = [Int]()
        for n in nums {
            result.append(abs(sum - n - leftSum - leftSum))
            leftSum += n
        }
        return result
    }
}
