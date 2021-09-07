/**
 * https://leetcode.com/problems/orderly-queue/
 * 
 * 
 */ 
// Date: Mon Sep  6 18:33:39 PDT 2021
class Solution {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        if k > 1 { return String(s.sorted()) }
        var minS = s
        let s = Array(s)
        for index in stride(from: 1, to: s.count, by: 1) {
            let text = String(s[index ..< s.count] + s[0 ..< index])

            if minS > text {
                minS = text
            }
        }
        return minS
    }
}