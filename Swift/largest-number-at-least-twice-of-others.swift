class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        guard let largest = nums.max() else { return -1 }
        var index = -1
        for idx in 0 ..< nums.count {
            if nums[idx] < largest {
                if nums[idx] * 2 > largest { return -1 }
            } else if nums[idx] == largest { index = idx }
        }
        return index
    }
}
