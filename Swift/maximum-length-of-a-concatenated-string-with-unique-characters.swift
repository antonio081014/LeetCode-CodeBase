/**
 * https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
 * 
 * 
 */ 
// Date: Thu Jun 18 11:57:17 PDT 2020
class Solution {
    func maxLength(_ arr: [String]) -> Int {
        var maxLen = 0
        let list: [Set<Character>] = arr.map {
            let result = Set($0)
            return result.count != $0.count ? [] : result
        } .filter { $0.isEmpty == false }
        
        func union(_ set: Set<Character>, _ candidate: [Set<Character>], _ start: Int) {
            maxLen = max(maxLen, set.count)
            if start >= candidate.count { return }
            for index in start ..< candidate.count {
                if candidate[index].isDisjoint(with: set) {
                    union(set.union(candidate[index]), candidate, index + 1)
                }
            }
        }
        
        union([], list, 0)
        return maxLen
    }
}
