/**
 * https://leetcode.com/problems/non-decreasing-array/
 * 
 * 
 */ 
// Date: Tue May  4 09:13:22 PDT 2021
class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        // print("Start")
        var a = nums
        var b = nums
        for index in stride(from: 1, to: nums.count, by: 1) {
            if nums[index] < nums[index - 1] {
                a[index] = nums[index - 1]
                b[index - 1] = nums[index]
                break
            }
            // print(lastMax)
        }
        return a == a.sorted() || b == b.sorted()
    }
}/**
 * https://leetcode.com/problems/non-decreasing-array/
 * 
 * 
 */ 
// Date: Tue May  4 09:21:41 PDT 2021
class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var nums = nums
        var count = 0
        for index in stride(from: 1, to: nums.count, by: 1) {
            if nums[index - 1] > nums[index] {
                count += 1
                // 
                //  /\            /\
                //    \          /
                //
                if index < 2 || nums[index - 2] <= nums[index] {
                    nums[index - 1] = nums[index]
                } else {
                    nums[index] = nums[index - 1]
                }
            }
        }
        return count <= 1
    }
}