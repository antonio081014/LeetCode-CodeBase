/**
 * https://leetcode.com/problems/single-number-ii/
 * 
 * 
 */ 

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var count: [Int : Int] = [:]
        for n in nums {
            count[n] = (count[n, default: 0] + 1)
        }
        return count.filter{$0.value == 1}.keys.first ?? 0
    }
}