/**
 * https://leetcode.com/problems/buddy-strings/
 * 
 * 
 */ 
// Date: Mon Oct 12 08:44:48 PDT 2020
class Solution {
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        let a = Array(A)
        let b = Array(B)
        var list = [Int]()
        guard A.count == B.count else { return false }
        for index in 0 ..< a.count {
            if a[index] != b[index] {
                list.append(index)
            }
        }
        if list.count != 2 { 
            if list.count == 0 {
                var visited: Set<Character> = []
                for c in A {
                    if visited.contains(c) { return true }
                    visited.insert(c)
                }
            }
            return false 
        }
        let idx1 = list.first!
        let idx2 = list.last!
        return a[idx1] == b[idx2] && a[idx2] == b[idx1]
    }
}