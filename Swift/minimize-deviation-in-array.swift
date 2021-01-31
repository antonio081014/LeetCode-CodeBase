/**
 * https://leetcode.com/problems/minimize-deviation-in-array/
 * 
 * 
 */ 
// Date: Sun Jan 31 00:05:43 PST 2021
class Solution {
    func minimumDeviation(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var list = [Int]()
        
        for n in nums {
            insert(&list, n % 2 == 0 ? n : n * 2)
        }
        var res = list.last! - list.first!
        while list.last! % 2 == 0 {
            insert(&list, list.last!/2)
            list.removeLast()
            res = min(res, list.last! - list.first!)
        }
        return res
    }
    
    // binary search insert
    func insert(_ nums: inout [Int], _ target: Int) {
        if nums.isEmpty {
            nums.append(target)
            return
        }
        
        var left = 0
        var right = nums.count
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        if left < nums.count, nums[left] == target {
            return
        } else {
            nums.insert(target, at: left)
        }
    }
}