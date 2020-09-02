/**
 * https://leetcode.com/problems/contains-duplicate-iii/
 * 
 * 
 */ 
// Date: Wed Sep  2 10:21:15 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n(log k + k)), n is the number of elements in nums, k is the maximum number of elements in list.
    ///     - Space: O(k), space for list.
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var list = [Int]()
        for index in 0 ..< nums.count {
            let n = nums[index]
            if list.count >= k + 1 {
                self.removeElement(nums[index - k - 1], from: &list)
            }
            let position = self.addElement(n, into: &list)
            // print("\(list) - \(position)")
            if list.count > 1 { 
                if position > 0, list[position] - list[position - 1] <= t { return true }
                if position + 1 < list.count, list[position + 1] - list[position] <= t { return true }
            }
        }
        return false
    }

    /// - Complexity:
    ///     - Time: O(log k + k), k is the number of elements in list
    ///     - Space: O(1)
    private func addElement(_ element: Int, into list: inout [Int]) -> Int {
        var left = 0
        var right = list.count
        while left < right {
            let mid = left + (right - left) / 2
            if list[mid] < element {
                left = mid + 1
            } else {
                right = mid
            }
        }
        /// Insert actually cost O(k), linear time.
        list.insert(element, at: left)
        return left
    }

    /// - Complexity:
    ///     - Time: O(log k), k is the number of elements in list
    ///     - Space: O(1)
    private func removeElement(_ element: Int, from list: inout [Int]) {
        var left = 0
        var right = list.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if list[mid] == element {
                list.remove(at: mid)
                return
            } else if list[mid] > element {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }
}

