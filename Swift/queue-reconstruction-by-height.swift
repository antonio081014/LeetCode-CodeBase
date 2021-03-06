/**
 * https://leetcode.com/problems/queue-reconstruction-by-height/
 * 
 * 
 */ 
class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let list = people.map({($0[0], $0[1])}).sorted(by: {
            if $0.0 == $1.0 {return $0.1 <= $1.1}
            return $0.0 >= $1.0
        })
        var ret = [[Int]]()
        for item in list {
            ret.insert([item.0, item.1], at: item.1)
        }
        return ret
    }
}

print("\(reconstructQueue([[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]))")
/**
 * https://leetcode.com/problems/queue-reconstruction-by-height/
 * 
 * 
 */ 
// Date: Sat Jun  6 22:43:22 PDT 2020
class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let ppl = people.sorted {
            $0[0] != $1[0] ? $0[0] > $1[0] : $0[1] < $1[1]
        }
        var result: [[Int]] = []
        for item in ppl {
            result.insert(item, at: item[1])
        }
        return result
    }
}
