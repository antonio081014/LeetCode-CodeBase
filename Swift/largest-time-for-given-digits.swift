/**
 * https://leetcode.com/problems/largest-time-for-given-digits/
 * 
 * 
 */ 
// Date: Tue Sep  1 12:21:49 PDT 2020
class Solution {
    /// Permutation of 4 digits.
    func largestTimeFromDigits(_ A: [Int]) -> String {
        func perm(_ result: [Int], from cand: [Int]) -> String? {
            if result.count == 4 { 
                let hour = result[0] * 10 + result[1]
                let minute = result[2] * 10 + result[3]
                if hour >= 0, hour < 24, minute >= 0, minute < 60 {
                    return String(format: "%02d:%02d", hour, minute)
                } else {
                    return nil
                }
            }
            var cand2 = cand
            for index in 0 ..< cand.count {
                let c = cand2.remove(at: index)
                let result2 = result + [c]
                if let text = perm(result2, from: cand2) {
                    return text
                }
                cand2.insert(c, at: index)
            }
            return nil
        }
        
        return perm([], from: A.sorted(by: >)) ?? ""
    }
}