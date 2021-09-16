/**
 * https://leetcode.com/problems/longest-turbulent-subarray/
 * 
 * 
 */ 
// Date: Wed Sep 15 23:23:37 PDT 2021
class Solution {
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        guard arr.count > 2 else { return Set(arr).count }
        var index = 1
        var result = 0
        var start = 0
        while index < arr.count {
            if arr[index] == arr[index - 1] {
                start = index
            } else if index >= 2, (arr[index - 1] - arr[index - 2]) * (arr[index] - arr[index - 1]) > 0 {
                    start = index - 1
            }
            result = max(result, index - start + 1)
            index += 1
        }
        
        return result
    }
}