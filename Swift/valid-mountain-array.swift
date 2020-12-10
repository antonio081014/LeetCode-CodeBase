/**
 * https://leetcode.com/problems/valid-mountain-array/
 * 
 * 
 */ 
// Date: Thu Dec 10 10:57:17 PST 2020
class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        var start = 0
        while start < arr.count - 1, arr[start] < arr[start + 1] {
            start += 1
        }
        if start == 0 || start == arr.count - 1 { return false }
        start += 1
        while start < arr.count, arr[start] < arr[start - 1] {
            start += 1
        }
        return start == arr.count
    }
}