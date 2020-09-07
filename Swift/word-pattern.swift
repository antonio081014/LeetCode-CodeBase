/**
 * https://leetcode.com/problems/word-pattern/
 * 
 * 
 */ 
// Date: Mon Sep  7 08:31:44 PDT 2020

class Solution {
    /// - Complexity: 
    ///     - Time: O(n + m), use O(n) to split, then O(m) to validate.
    ///     - Space: O(n + m), for two dictionaries.
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let list = str.split(separator: " ")
        if pattern.count != list.count { return false }
        var dict1: [Character : String] = [:]
        var dict2: [String : Character] = [:]
        for (index, c) in pattern.enumerated() {
            let v = String(list[index])
            if let value = dict1[c], value != v { return false }
            if let value = dict2[v], value != c { return false }
            dict1[c] = v
            dict2[v] = c
        }
        return true
    }
}