/**
 * https://leetcode.com/problems/maximum-units-on-a-truck/
 * 
 * 
 */ 
// Date: Mon Jun 14 11:02:41 PDT 2021
class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let sorted = boxTypes.sorted { $0[1] > $1[1] }
        var result = 0
        var left = truckSize
        var index = 0
        while index < sorted.count, left > 0 {
            result += min(sorted[index][0], left) * sorted[index][1]
            left -= sorted[index][0]
            index += 1
        }
        return result
    }
}