/**
 * https://leetcode.com/problems/open-the-lock/
 * 
 * 
 */ 
// Date: Fri Jun  4 10:49:11 PDT 2021
class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let deadends = Set(deadends.map { Array($0).map { $0.asciiValue! - 48 }})
        let target = Array(target).map { $0.asciiValue! - 48 }
        // Good thing to learn:
        // An UInt8 var could never go neg.
        // e.g.: n(value: 1) - 2 + 8, though the final value is non-neg.
        // will get an error for 1 - 2.
        var queue = [[UInt8]]()
        var steps: [[UInt8] : Int] = [:]
        if deadends.contains([0,0,0,0]) == false {
            steps[[0,0,0,0]] = 0
            queue.append([0,0,0,0])
        }
        
        while queue.isEmpty == false {
            var cand = queue.removeFirst()
            if cand == target { return steps[cand, default: -1] }
            let step = steps[cand, default: 0]
            // print(cand, steps[cand, default: -1])
            for index in 0 ..< cand.count {
                cand[index] = (cand[index] + 1) % 10
                if steps[cand] == nil, deadends.contains(cand) == false {
                    queue.append(cand)
                    steps[cand] = step + 1
                }
                cand[index] = (cand[index] + 8) % 10
                if steps[cand] == nil, deadends.contains(cand) == false {
                    queue.append(cand)
                    steps[cand] = step + 1
                }
                cand[index] = (cand[index] + 1) % 10
            }
        }
        return -1
    }
}