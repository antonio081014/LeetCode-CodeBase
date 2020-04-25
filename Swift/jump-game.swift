/**
 * https://leetcode.com/problems/jump-game/
 * 
 * 
 */ 
// Date: Sat Apr 25 11:12:14 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), where n is the number of elements in the array.
    ///     - Space: O(1).
    ///
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 0 else { return true }
        var far = nums[0]
        for index in 1 ..< nums.count {
            if index > far {
                return false
            }
            far = max(far, index + nums[index])
        }
        return far >= nums.count - 1
    }
}
