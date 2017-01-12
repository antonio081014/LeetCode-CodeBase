/**
 * https://leetcode.com/problems/third-maximum-number/
 * 
 * 
 */ 
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var indexofmax1:Int? = nil
        var indexofmax2:Int? = nil
        var indexofmax3:Int? = nil
        for var i in 0..<nums.count {
            if indexofmax1==nil || nums[indexofmax1!]<nums[i] {
                indexofmax3 = indexofmax2
                indexofmax2 = indexofmax1
                indexofmax1 = i
            } else if (indexofmax1 != nil) && nums[indexofmax1!]>nums[i] && (indexofmax2==nil || nums[indexofmax2!]<nums[i]) {
                indexofmax3 = indexofmax2
                indexofmax2 = i
            } else if (indexofmax2 != nil) && nums[indexofmax2!]>nums[i] && (indexofmax3==nil || nums[indexofmax3!]<nums[i]) {
                indexofmax3 = i
            }
            // print("\(indexofmax1) - \(indexofmax2) - \(indexofmax3)")
        }
        if let index = indexofmax3 {
            return nums[index]
        }
        return nums[indexofmax1!]
    }
}
