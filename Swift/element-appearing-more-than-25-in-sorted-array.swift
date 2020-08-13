/**
 * https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/
 * 
 * 
 */ 
// Date: Thu Aug 13 14:18:04 PDT 2020
class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        var last: Int? = nil
        var count = 0
        for n in arr {
            if let num = last {
                if num == n {
                    count += 1
                } else {
                    last = n
                    count = 1
                }
            } else {
                last = n
                count = 1
            }
            // print("\(last) : \(count)")
            if count * 4 > arr.count {
                return last!
            }
        }
        return -1
    }
}
