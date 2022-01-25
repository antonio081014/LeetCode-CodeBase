/**
 * https://leetcode.com/problems/valid-mountain-array/
 * 
 * 
 */ 
// Date: Thu Dec 10 10:57:17 PST 2020
class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        var start = 0
        while start < arr.count - 1, arr[start] < arr[start + 1] {
            start += 1
        }
        if start == 0 || start == arr.count - 1 { return false }
        start += 1
        while start < arr.count, arr[start] < arr[start - 1] {
            start += 1
        }
        return start == arr.count
    }
}

class Solution {
    /// - Complexity:
    ///     - Time: O(n), n = arr.count.
    ///     - Space: O(1), constant space.
    func validMountainArray(_ arr: [Int]) -> Bool {
        guard arr.count >= 3 else { return false }
        var left = 0
        while left + 1 < arr.count, arr[left] < arr[left + 1] {
            left += 1
        }
        
        var right = arr.count - 1
        while right - 1 >= 0, arr[right] < arr[right - 1] {
            right -= 1
        }
        return left == right && left > 0 && right < arr.count - 1
    }
}
