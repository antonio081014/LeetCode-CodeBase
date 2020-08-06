/**
 * https://leetcode.com/problems/find-all-duplicates-in-an-array/
 * 
 * 
 */ 
class Solution {
    // Since function parameter in Swift is immutable, really can't make it negtive or modify it.
    // So, extra space is required for this solution.
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var dict = [Int:Bool]()
        var ret = [Int]()
        for n in nums {
            if let x = dict[n] {
                ret += [n]
            } else {
                dict[n] = true
            }
        }
        return ret
    }
}
/**
 * https://leetcode.com/problems/find-all-duplicates-in-an-array/
 * 
 * 
 */ 
// Date: Thu Aug  6 08:53:22 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the length of array.
    ///     - Space: O(n), n is the length of array.
    ///
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var visited: Set<Int> = []
        for n in nums {
            if visited.contains(n) {
                result.append(n)
            }
            visited.insert(n)
        }
        return result
    }
}
/**
 * https://leetcode.com/problems/find-all-duplicates-in-an-array/
 * 
 * 
 */ 
// Date: Thu Aug  6 09:01:46 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the length of array.
    ///     - Space: O(1), if we don't count the copy of nums.
    ///
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var nums = nums
        for index in 0 ..< nums.count {
            let n = abs(nums[index])
            if nums[n - 1] < 0 {
                result.append(n)
            } else {
                nums[n - 1] = -nums[n - 1]
            }
        }
        return result
    }
}
