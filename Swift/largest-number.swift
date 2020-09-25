/**
 * https://leetcode.com/problems/largest-number/
 * 
 * 
 */ 
// Date: Fri Sep 25 09:36:51 PDT 2020
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let nums = nums.map { String($0) }.sorted(by: {
            let n1 = Int($0 + $1)!
            let n2 = Int($1 + $0)!
            return n1 > n2
        })
        var result = nums.joined()
        while result.count > 1 {
            if let first = result.first, let n = Int(String(first)), n == 0 {
                result.removeFirst()
            } else { break }
        }
        return result
    }
}