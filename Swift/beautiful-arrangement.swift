/**
 * https://leetcode.com/problems/beautiful-arrangement/
 * 
 * 
 */ 
// Date: Sun Jan  3 17:23:07 PST 2021
class Solution {
    func countArrangement(_ n: Int) -> Int {
        var result = 0
        func dfs(_ candidate: inout Set<Int>, at index: Int) {
            if candidate.isEmpty {
                result += 1
                return
            }
            let list = Array(candidate)
            for cand in list {
                if cand % index == 0 || index % cand == 0 {
                    candidate.remove(cand)
                    dfs(&candidate, at: index + 1)
                    candidate.insert(cand)
                }
            }
        }
        var candidates = Set(1 ... n)
        dfs(&candidates, at: 1)
        return result
    }
}