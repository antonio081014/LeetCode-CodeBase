/**
 * Problem Link: https://leetcode.com/problems/contains-duplicate-ii/
 *
 */

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        let n = nums.count
        var dict = [Int:Int]()
        for i in 0..<n {
            if let x = dict[nums[i]] {
                if i - x <= k {
                    return true
                }
                
            }
            dict[nums[i]] = i
        }
        return false
    }
}
