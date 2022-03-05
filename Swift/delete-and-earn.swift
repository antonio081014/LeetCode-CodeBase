/**
 * https://leetcode.com/problems/delete-and-earn/
 * 
 * 
 */ 
// Date: Sat Mar  5 15:00:12 PST 2022
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        let n = 10000
        var sum = [Int : Int]()
        for n in nums {
            sum[n, default: 0] += n
        }
        var usedSum = 0
        var skipSum = 0
        for key in 1 ... n {
            let taken = skipSum + sum[key, default: 0]
            let skipMax = max(usedSum, skipSum)
            usedSum = taken
            skipSum = skipMax
        }
        return max(usedSum, skipSum)
    }
}