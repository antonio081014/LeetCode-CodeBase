/**
 * https://leetcode.com/problems/find-the-town-judge/
 * 
 * 
 */ 
// Date: Sun May 10 13:24:03 PDT 2020
class Solution {
    
    struct Degree {
        var ins: Int
        var outs: Int
        init() {
            self.ins = 0
            self.outs = 0
        }
        
        mutating func trusting() {
            self.outs += 1
        }
        
        mutating func trusted() {
            self.ins += 1
        }
    }
    
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var record = Array(repeating: Degree(), count: N + 1)
        for relation in trust {
            let a = relation[0]
            let b = relation[1]
            record[a].trusting()
            record[b].trusted()
        }
        var ret: [Int] = []
        for index in 1 ... N {
            if record[index].ins == N - 1, record[index].outs == 0 {
                ret.append(index)
            }
        }
        return ret.count == 1 ? ret[0] : -1
    }
}
/**
 * https://leetcode.com/problems/find-the-town-judge/
 * 
 * 
 */ 
// Date: Sun Jan  2 23:19:50 PST 2022
class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var trusting = Array(repeating: 0, count: n + 1)
        var trusted = Array(repeating: 0, count: n + 1)
        for t in trust {
            trusting[t[0]] += 1
            trusted[t[1]] += 1
        }
        
        for x in 1 ... n {
            if trusting[x] == 0, trusted[x] == n - 1 {
                return x
            }
        }
        return -1
    }
}