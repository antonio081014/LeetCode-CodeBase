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
