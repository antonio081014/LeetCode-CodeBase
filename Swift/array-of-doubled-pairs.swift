/**
 * https://leetcode.com/problems/array-of-doubled-pairs/
 * 
 * 
 */ 
// Date: Wed Aug 11 16:53:37 PDT 2021
class Solution {
    func canReorderDoubled(_ arr: [Int]) -> Bool {
        var count: [Int : Int] = [:]
        for n in arr {
            count[n, default: 0] += 1
        }

        let keys = count.keys.sorted { abs($0) < abs($1) }

        for key in keys {
            if count[key, default: 0] > count[key * 2, default: 0] { return false }
            count[key * 2, default: 0] -= count[key, default: 0]
        }
        return true
    }
}