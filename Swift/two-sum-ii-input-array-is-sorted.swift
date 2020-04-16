/**
 * https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
 * 
 * 
 */

/// Two pointers.
/// - Complexity:
///     - Time: O(n), n is the number of elements in the array.
///     - Space: O(1)
///
class Solution {
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            // print("\(left) - \(right)")
            if target == numbers[left] + numbers[right] {return [left+1, right+1]}
            else if target < numbers[left] + numbers[right] {right -= 1}
            else {left += 1}
        }
        return [0, 0]
    }
}

/// Binary Search
/// - Complexity:
///     - Time: O(nlogn), n is the number of elements in the array.
///     - Space: O(1)
///
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for index in 0 ..< numbers.count {
            let tmp = target - numbers[index]
            var left = index + 1
            var right = numbers.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if numbers[mid] == tmp {
                    return [index + 1, mid + 1]
                } else if numbers[mid] > tmp {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return [0, 0]
    }
}

/// Dictionary:
///     - Time: O(n), n is the number of elements in the array.
///     - Space: O(n), we have a dictionary to keep the value and its index we have visited.
///

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict: [Int : Int] = [:]
        for index in 0 ..< numbers.count {
            if let idx1 = dict[target - numbers[index]] {
                return [idx1 + 1, index + 1]
            }
            dict[numbers[index]] = index
        }
        return [0, 0]
    }
}
