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
}