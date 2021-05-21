/**
 * https://leetcode.com/problems/find-and-replace-pattern/
 * 
 * 
 */ 
// Date: Fri May 21 11:51:49 PDT 2021
class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        var result = [String]()
        for w in words {
            if self.transformable(from: w, to: pattern) {
                result.append(w)
            }
        }
        return result
    }
    
    private func transformable(from a: String, to b: String) -> Bool {
        var map1 = [Character : Character]()
        var map2 = [Character : Character]()
        let a = Array(a)
        let b = Array(b)
        for index in 0 ..< a.count {
            if map1[a[index]] == nil {
                map1[a[index]] = b[index]
            }
            if map2[b[index]] == nil {
                map2[b[index]] = a[index]
            }
            if map1[a[index]]! != b[index] || map2[b[index]]! != a[index] { return false }
        }
        return true
    }
}