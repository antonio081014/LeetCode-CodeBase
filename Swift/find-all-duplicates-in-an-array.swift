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
