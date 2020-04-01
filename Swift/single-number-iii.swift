/**
 * https://leetcode.com/problems/single-number-iii/
 * 
 * 
 */ 
class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var list: Set<Int> = []
        for n in nums {
            if list.contains(n) {
                list.remove(n)
            } else {
                list.insert(n)
            }
        }
        return Array(list)
    }
}


class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var diff = 0
        for n in nums {
            diff ^= n
        }
        /// This will help get the rightmost bit set, start with 1st '1' bit from right.
        /// Example:
        ///     7 and 1
        ///     diff = XOR(7, 1) = 0b0110,
        ///     diff ^= diff, diff = 0b0010,
        ///         So the second bit from right will be the key ones to seperate a and b.
        ///
        ///     7 and 2
        ///     diff = XOR(7, 2) = 0b0101,
        ///     diff ^= diff, diff = 0b0001,
        ///         So the first bit from right will be the key ones to seperate a and b.
        ///
        /// The key is to find the one key bit to diff one group from another.
        ///
        diff &= -diff
        
        var a = 0
        var b = 0
        
        for n in nums {
            if n & diff == 0 {
                a ^= n
            } else {
                b ^= n
            }
        }
        return [a, b]
    }
}
