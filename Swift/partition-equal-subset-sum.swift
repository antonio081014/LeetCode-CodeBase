/**
 * https://leetcode.com/problems/partition-equal-subset-sum/
 * 
 * 
 */ 
// Date: Fri Nov 27 16:18:27 PST 2020
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0) { $0 + $1 }
        if sum % 2 != 0 { return false }
        let half = sum / 2
        var mark = Array(repeating: Array(repeating: false, count: half + 1), count: 2)
        mark[0][0] = true
        for index in 1 ... nums.count {
            let n = nums[index - 1]
            for sum in 0 ... half {
                mark[index % 2][sum] = mark[1 - index % 2][sum]
                if sum >= n {
                    mark[index % 2][sum] = mark[index % 2][sum] || mark[1 - index % 2][sum - n]
                }
            }
        }
        return mark[nums.count % 2][half]
    }
}