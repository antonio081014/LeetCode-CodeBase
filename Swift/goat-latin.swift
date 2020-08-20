/**
 * https://leetcode.com/problems/goat-latin/
 * 
 * 
 */ 
// Date: Wed Aug 19 17:18:51 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the number of single words in S.
    ///     - Space: O(length of S)
    ///
    func toGoatLatin(_ S: String) -> String {
        var list = S.split(separator: " ")
        var trailing = ""
        for index in 0 ..< list.count {
            trailing += "a"
            var origin = list[index]
            if let first = origin.first, "aeiou".contains(first) == false, "AEIOU".contains(first) == false {
                origin += String(origin.removeFirst())
            }
            origin += "ma" + trailing
            list[index] = origin
        }
        return list.joined(separator: " ")
    }
}