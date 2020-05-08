/**
 * https://leetcode.com/problems/shuffle-an-array/
 * 
 * 
 */ 
// Date: Thu May  7 15:59:17 PDT 2020
class Solution {
    
    private let list: [Int]
    
    init(_ nums: [Int]) {
        self.list = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return self.list
    }
    
    /// This algorithms is from source code Swift Library.
    /// https://github.com/apple/swift/blob/b1b725ac83ea965f64d8da83d97d31d95be22f2c/stdlib/public/core/CollectionAlgorithms.swift#L591
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var indices = Array((0 ..< self.list.count).map { $0 })
        guard indices.count > 1 else { return self.list }
        var amount = indices.count
        var currentIndex = indices.startIndex
        while amount > 1 {
            let random = Int.random(in: 0 ..< amount)
            amount -= 1
            indices.swapAt(currentIndex, indices.index(currentIndex, offsetBy: random))
            indices.formIndex(after: &currentIndex)
        }
        
        return Array(indices.map { self.list[$0] })
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
