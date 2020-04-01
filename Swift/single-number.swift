class Solution {
    /// - Complexity:
    ///     - Time: O(n), where n is the number of elements in the array
    ///     - Space: O(1).
    func singleNumber(_ nums: [Int]) -> Int {
        var sum = 0
        for n in nums {
            sum ^= n
        }
        return sum
    }
}
/**
 * https://leetcode.com/problems/single-number/
 * 
 * 
 */ 
class Solution {
    /// Go through every element in the array.
    /// When first met a number, insert it to the Set,
    /// Otherwise, it's not the first time, just remove it from Set.
    /// Return the only one left in the Set.
    ///
    /// - Complexity: O(n), where n is the number of elements in the array.
    ///
    func singleNumber(_ nums: [Int]) -> Int {
        var num: Set<Int> = []
        for n in nums {
            if num.contains(n) {
                num.remove(n)
            } else {
                num.insert(n)
            }
        }
        return Array(num).first!
    }
}
