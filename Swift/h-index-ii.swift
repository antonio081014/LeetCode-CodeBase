/**
 * https://leetcode.com/problems/h-index-ii/
 * 
 * 
 */ 
// Date: Thu Jun 18 09:09:00 PDT 2020
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var left = 0
        var right = citations.count
        while left < right {
            let mid = left + (right - left) / 2
            if citations[mid] < (citations.count - mid) {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return citations.count - left
    }
}
