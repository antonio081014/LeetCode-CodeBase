class Solution {
    func singleNumber(_nums: [Int]) -> Int {
        var nums = _nums
        for i in 1..<nums.count {
            nums[0] ^= nums[i]
        }
        return nums[0]
    }
}
