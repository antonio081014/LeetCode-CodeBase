/**
 * https://leetcode.com/problems/increasing-triplet-subsequence/
 * 
 * 
 */ 
// Date: Fri Dec 18 17:30:41 PST 2020
class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return false }
        
        var mins: [Int] = []
        var maxs: [Int] = []
        
        for index in 0 ..< nums.count {
            if let left = mins.last {
                mins.append(min(left, nums[index]))
            } else {
                mins.append(nums[index])
            }
            if let right = maxs.last {
                maxs.append(max(right, nums[nums.count - 1 - index]))
            } else {
                maxs.append(nums[nums.count - 1 - index])
            }
        }
        maxs = maxs.reversed()
        // print(mins)
        // print(maxs)
        for index in 1 ..< nums.count - 1 {
            if mins[index - 1] < nums[index], nums[index] < maxs[index + 1] {
                return true
            }
        }
        return false
    }
}