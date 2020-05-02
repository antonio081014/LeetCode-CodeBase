/**
 * Problem Link: https://leetcode.com/problems/contains-duplicate-ii/
 *
 */

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        let n = nums.count
        var dict = [Int:Int]()
        for i in 0..<n {
            if let x = dict[nums[i]] {
                if i - x <= k {
                    return true
                }
                
            }
            dict[nums[i]] = i
        }
        return false
    }
}
/**
 * https://leetcode.com/problems/contains-duplicate-ii/
 * 
 * 
 */ 
// Date: Sat May  2 12:52:15 PDT 2020
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var lastIndex: [Int : Int] = [:]
        for index in 0 ..< nums.count {
            if let last = lastIndex[nums[index]], index - last <= k {
                return true
            }
            lastIndex[nums[index]] = index
        }
        return false
    }
}