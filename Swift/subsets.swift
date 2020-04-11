/**
 * https://leetcode.com/problems/subsets/
 * 
 * 
 */ 
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var ret: [[Int]] = []
        process(&ret, [], nums, 0)
        return ret
    }
    
    /// Process element at `currentIndex`
    ///
    /// Two options will be available here: add it to result, or not.
    ///
    /// Base case: when `currentIndex` reaches the end of `candidate`
    ///
    fileprivate func process(_ solution: inout [[Int]], _ result: [Int], _ candidate: [Int], _ currentIndex: Int) {
        if currentIndex >= candidate.count {
            solution.append(result)
            return
        }
        process(&solution, result + [candidate[currentIndex]], candidate, currentIndex + 1)
        process(&solution, result, candidate, currentIndex + 1)
        
    }
}
