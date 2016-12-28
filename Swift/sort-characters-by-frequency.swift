/**
 * https://leetcode.com/problems/sort-characters-by-frequency/
 * 
 * 
 */ 
class Solution {
    func frequencySort(_ s: String) -> String {
        var dict = [Character : Int]()
        for c in s.characters {
            if let x = dict[c] {
                dict[c] = x + 1
            } else {
                dict[c] = 1
            }
        }
        
        var list: [(Character , Int)] = dict.map { (key, value) in (key, value) }
        list.sort {$0.1 > $1.1}
        var str = ""
        for (c, x) in list {
            for _ in 0..<x {
                str += String(c)
            }
        }
        return str
    }
}
