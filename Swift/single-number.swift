/**
 * https://leetcode.com/problems/single-number/
 *
 *
 */

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

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return self.singleNumber(nums, with: 2)
    }
    
    fileprivate func singleNumber(_ nums: [Int], with repeatNumber: Int) -> Int {
        var ret = 0
        for bit in 0 ..< 64 {
            var count = 0
            for n in nums {
                if ((n >> bit) & 1) == 1 { count += 1 }
            }
            count %= repeatNumber
            ret |= (count << bit)
        }
        return ret
    }
}

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
/**
 * https://leetcode.com/problems/single-number/
 * 
 * 
 */ 
// Date: Sun May  3 09:39:26 PDT 2020
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 ^ $1 }
    }
}

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
    }
}
