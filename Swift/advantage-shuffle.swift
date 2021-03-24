/**
 * https://leetcode.com/problems/advantage-shuffle/
 * 
 * 
 */ 
// Date: Wed Mar 24 08:54:50 PDT 2021
class Solution {
    func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
        let a = A.sorted()
        let b = B.enumerated().sorted { $0.1 < $1.1 }
        var result = A
        var start = 0
        var end = A.count - 1
        for num in a {
            if num > b[start].1 {
                result[b[start].0] = num
                start += 1
            } else {
                result[b[end].0] = num
                end -= 1
            }
        }
        return result
    }
}