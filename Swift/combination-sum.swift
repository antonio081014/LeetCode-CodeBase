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
    
    /// Knapsack Problem
    /// Unlimit use of items in the back.
    ///
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

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        let cand = candidates.sorted()
        if target >= cand[0] {
            for n in 1 ... Int(target / cand[0]) {
                dfs(cand, target, 0, 0, n, &current, &result)
            }
        }
        return result
    }
    
    fileprivate func dfs(_ candidates: [Int], _ target: Int, _ start: Int, _ deepth: Int, _ maxDeepth: Int, _ current: inout [Int], _ result: inout [[Int]]) {
        if deepth == maxDeepth {
            if target == 0 {
                result.append(current)
            }
            return
        }
        
        for index in start ..< candidates.count {
            if candidates[index] > target { break }
            current.append(candidates[index])
            dfs(candidates, target - candidates[index], index, deepth + 1, maxDeepth, &current, &result)
            current.removeLast()
        }
    }
}
