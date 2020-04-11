/**
 * https://leetcode.com/problems/combination-sum/
 * 
 * 
 */ 
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ret: Set<[Int]> = []
        process(&ret, [], target, candidates)
        return Array(ret)
    }
    
    fileprivate func process(_ solution: inout Set<[Int]>, _ result: [Int], _ target: Int, _ candidate: [Int]) {
        if 0 == target {
            solution.insert(result.sorted())
            return
        }
        
        for index in 0 ..< candidate.count {
            if target >= candidate[index] {
                process(&solution, result + [candidate[index]], target - candidate[index], candidate)
            }
        }
    }
}
