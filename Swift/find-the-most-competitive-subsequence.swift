/**
 * https://leetcode.com/problems/find-the-most-competitive-subsequence/
 * 
 * 
 */ 
// Date: Thu Jan 21 13:05:04 PST 2021
class Solution {
    func mostCompetitive(_ nums: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        for index in 0 ..< nums.count {
            while let last = result.last, last > nums[index], nums.count - index + result.count > k {
                result.removeLast()
            }
            if result.count < k {
                result.append(nums[index])
            }
        }
        return result
    }
}