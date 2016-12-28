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
    
    // Heavily use Swift standard library built-in functions.
    func frequencySort(_ s: String) -> String {
        return s.characters.reduce([String: Int](), {
            var d = $0
            let c = String($1)
            if d[c] == nil {
                d[c] = 1
            } else {
                d[c] = 1 + d[c]!
            }
            return d
        }).map({($0, $1)}).sorted(by: {
            $0.1 > $1.1
        }).reduce("", {
            var ret = ""
            for _ in 0..<$1.1 {ret += $1.0}
            return $0 + ret
        })
    }
    
}

print("\(frequencySort("tree"))")
