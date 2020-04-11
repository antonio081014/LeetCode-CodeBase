/**
 * https://leetcode.com/problems/permutations/
 * 
 * 
 */ 
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var ret: [[Int]] = []
        process(&ret, [], &nums)
        return ret
    }
    
    /// Try out all the possible choice for the next element in this `solution` (permutation)
    /// If we have none choice left in candidate, it means we have all choices in current `solution` (permutation), then it's a valid solution.
    ///
    ///
    /// - Parameters:
    ///     - result: final result, which contains all the solutions (possible permutations.)
    ///     - solution: current working partial solution, could be one of possible permutation.
    ///     - candidate: all the possible choices left to choose for the rest of current permutation.
    ///
    fileprivate func process(_ result: inout [[Int]], _ solution: [Int], _ candidate: inout [Int]) {
        if candidate.isEmpty {
            result.append(solution)
            return
        }
        for index in 0 ..< candidate.count {
            let tmp = candidate[index]
            candidate.remove(at: index)
            process(&result, solution + [tmp], &candidate)
            candidate.insert(tmp, at: index)
        }
    }
}
