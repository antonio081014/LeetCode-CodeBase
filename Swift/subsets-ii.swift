/**
 * https://leetcode.com/problems/subsets-ii/
 * 
 * 
 */ 
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var ret: Set<[Int]> = []
        process(&ret, [], nums, 0)
        return Array(ret)
    }
    
    fileprivate func process(_ solution: inout Set<[Int]>, _ result: [Int], _ candidate: [Int], _ currentIndex: Int) {
        if currentIndex >= candidate.count {
            solution.insert(result)
            return
        }
        process(&solution, result + [candidate[currentIndex]], candidate, currentIndex + 1)
        process(&solution, result, candidate, currentIndex + 1)
        
    }
}
