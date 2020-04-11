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
