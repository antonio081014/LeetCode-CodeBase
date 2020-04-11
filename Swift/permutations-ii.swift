/**
 * https://leetcode.com/problems/permutations-ii/
 * 
 * 
 */ 
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var ret: Set<[Int]> = []
        process(&ret, [], &nums)
        return Array(ret)
    }
    
    fileprivate func process(_ result: inout Set<[Int]>, _ solution: [Int], _ candidate: inout [Int]) {
        if candidate.isEmpty {
            result.insert(solution)
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
/**
 * https://leetcode.com/problems/permutations-ii/
 * 
 * 
 */ 
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var cand: [Int : Int] = [:]
        for n in nums {
            cand[n] = 1 + cand[n, default: 0]
        }
        var ret: [[Int]] = []
        process(&ret, [], &cand)
        return ret
    }
    
    /// Use a map to remove duplicate cases.
    /// In this method, e.g, when we use a 1, we don't care which 1 we are using, we only cares about how many
    /// left.
    ///
    fileprivate func process(_ result: inout [[Int]], _ solution: [Int], _ candidate: inout [Int : Int]) {
        if candidate.isEmpty {
            result.append(solution)
            return
        }
        
        for (key, value) in candidate {
            candidate[key] = value == 1 ? nil : value - 1
            process(&result, solution + [key], &candidate)
            candidate[key] = value
        }
    }
}
