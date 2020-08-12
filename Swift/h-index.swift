/**
 * https://leetcode.com/problems/h-index/
 * 
 * 
 */ 
// Date: Tue Aug 11 10:24:05 PDT 2020
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        var bucket = Array(repeating: 0, count: n + 1)
        for c in citations {
            bucket[min(c, n)] += 1
        }
        var count = 0
        for index in stride(from: n, through: 0, by: -1) {
            count += bucket[index]
            if count >= index {
                return index
            }
        }
        return 0
    }
}
