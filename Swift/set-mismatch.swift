/**
 * https://leetcode.com/problems/set-mismatch/
 * 
 * 
 */ 
// Date: Tue Mar  2 13:53:28 PST 2021
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var cand: Set<Int> = []
        var missing = -1
        var sum = (1 + nums.count) * nums.count / 2
        for x in nums {
            if cand.contains(x) == false{
                cand.insert(x)
                sum -= x
            } else {
                missing = x
            }
        }
        return [missing, sum]
    }
}