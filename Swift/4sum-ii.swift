/**
 * https://leetcode.com/problems/4sum-ii/
 * 
 * 
 */ 
// Date: Thu Dec 17 10:28:28 PST 2020
class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        let dict1 = self.combine(A, B)
        let dict2 = self.combine(C, D)
        var result = 0
        for (sum, count1) in dict1 {
            if let count2 = dict2[-sum] {
                result += count1 * count2
            }
        }
        return result
    }

    /// - Complexity:
    ///     - Time: O(n^2)
    ///     - Space: O(n^2)
    private func combine(_ A: [Int], _ B: [Int]) -> [Int : Int] {
        var result: [Int : Int] = [:]
        for a in A {
            for b in B {
                result[a + b] = 1 + result[a + b, default: 0]
            }
        }
        return result
    }
}