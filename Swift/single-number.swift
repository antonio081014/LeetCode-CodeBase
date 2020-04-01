class Solution {
    func singleNumber(_nums: [Int]) -> Int {
        var nums = _nums
        for i in 1..<nums.count {
            nums[0] ^= nums[i]
        }
        return nums[0]
    }
}
/**
 * https://leetcode.com/problems/single-number/
 * 
 * 
 */ 
class Solution {
    /// Go through every element in the array.
    /// When first met a number, insert it to the Set,
    /// Otherwise, it's not the first time, just remove it from Set.
    /// Return the only one left in the Set.
    ///
    /// - Complexity: O(n), where n is the number of elements in the array.
    ///
    func singleNumber(_ nums: [Int]) -> Int {
        var num: Set<Int> = []
        for n in nums {
            if num.contains(n) {
                num.remove(n)
            } else {
                num.insert(n)
            }
        }
        return Array(num).first!
    }
}
