/**
 * https://leetcode.com/problems/verifying-an-alien-dictionary/
 * 
 * 
 */ 
// Date: Fri Apr  9 14:30:32 PDT 2021
class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var mappedOrder = [Character : Int]()
        order.enumerated().forEach { mappedOrder[$1] = $0 }
        let sorted = words.sorted { (a, b) -> Bool in
            var index = 0
            let a = Array(a)
            let b = Array(b)
            while true {
                if index >= a.count { return true }
                if index >= b.count { return false }
                if a[index] != b[index] {
                    return mappedOrder[a[index], default: 0] < mappedOrder[b[index], default: 0]
                }
                index += 1
            }
        }
        return sorted == words
    }
}