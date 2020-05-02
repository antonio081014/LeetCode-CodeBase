/**
 * https://leetcode.com/problems/contains-duplicate/
 * 
 * 
 */ 
// Date: Sat May  2 12:45:51 PDT 2020
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = []
        for n in nums {
            if set.contains(n) {
                return true
            }
            set.insert(n)
        }
        return false
    }
}