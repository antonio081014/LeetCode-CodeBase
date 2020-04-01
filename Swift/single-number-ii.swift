/**
 * https://leetcode.com/problems/single-number-ii/
 * 
 * 
 */ 

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return self.singleNumber(nums, with: 3)
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
    
    func singleNumber(_ nums: [Int]) -> Int {
        var count: [Int : Int] = [:]
        for n in nums {
            count[n] = (count[n, default: 0] + 1)
        }
        return count.filter{$0.value == 1}.keys.first ?? 0
    }
}
