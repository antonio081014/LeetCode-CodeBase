/**
 * https://leetcode.com/problems/single-number-iii/
 * 
 * 
 */ 
class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var list: Set<Int> = []
        for n in nums {
            if list.contains(n) {
                list.remove(n)
            } else {
                list.insert(n)
            }
        }
        return Array(list)
    }
}
