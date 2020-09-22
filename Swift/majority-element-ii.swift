/**
 * https://leetcode.com/problems/majority-element-ii/
 * 
 * 
 */ 
// Date: Tue Sep 22 09:48:02 PDT 2020
class Solution {
    /// - Complexity: 
    ///     - Time: O(n)
    ///     - Space: O(n)
    func majorityElement(_ nums: [Int]) -> [Int] {
        var count: [Int : Int] = [:]
        let n = nums.count
        var result: Set<Int> = []
        for num in nums {
            count[num] = count[num, default: 0] + 1
            if count[num, default: 0] > n / 3 {
                result.insert(num)
            }
        }
        return Array(result)
    }
}