/**
 * Problem Link: https://leetcode.com/problems/two-sum/
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for n in 0..<nums.count {
            if dict[nums[n]] != nil {
                return [dict[nums[n]]!, n]
            } else {
                dict[target - nums[n]] = n
            }
        }
        return [Int]()
    }
}
