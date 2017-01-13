/**
 * https://leetcode.com/problems/implement-strstr/
 * 
 * 
 */ 
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hay = haystack.characters.map() {"\($0)"}
        let pat = needle.characters.map() {"\($0)"}
        var i = 0
        while true {
            var j = 0
            while true {
                if j == pat.count {return i}
                if i+j==hay.count {return -1}
                if hay[i+j] != pat[j] { break }
                j += 1
            }
            i += 1
        }
        return 0
    }
}
