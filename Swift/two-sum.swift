/**
 * Problem Link: https://leetcode.com/problems/two-sum/
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for n in 0..<nums.count {
            if dict[nums[n]] != nil {
                return [dict[nums[n]]!, n]
            } else {
                dict[target - nums[n]] = n
            }
        }
        return [Int]()
    }
}

// Wed Mar 25 14:03:04 PDT 2020
class Solution {
    /// Go through every element in the array.
    /// While remembering the index of every element visited.
    /// If target - nums[index] is in the indexMap, which means that element has been visited before.
    /// then, return the indices of these two.
    /// otherwise, keep visiting every element, while remember it and its index.
    ///
    /// - Complexity: O(n), n is the number of element in the array.
    ///
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indexMap: [Int : Int] = [:]
        for index in 0 ..< nums.count {
            if let pIndex = indexMap[target - nums[index]] {
                return [pIndex, index]
            }
            indexMap[nums[index]] = index
        }
        return [0, 0]
    }
}
