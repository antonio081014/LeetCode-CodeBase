/**
 * https://leetcode.com/problems/intersection-of-two-arrays-ii/
 * 
 * 
 */ 
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var ret: [Int] = []
        var dict: [Int : Int] = [:]
        
        for n in nums1 {
            dict[n] = dict[n, default: 0] + 1
        }
        
        for n in nums2 {
            if let count = dict[n] {
                if count > 0 {
                    ret.append(n)
                    dict[n] = count - 1
                }
            }
        }
        return ret
    }
}
