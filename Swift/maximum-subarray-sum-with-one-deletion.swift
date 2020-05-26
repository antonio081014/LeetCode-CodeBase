/**
 * https://leetcode.com/problems/maximum-subarray-sum-with-one-deletion/
 * 
 * 
 */ 
// Date: Tue May 26 13:48:29 PDT 2020
class Solution {
    func maximumSum(_ arr: [Int]) -> Int {
        guard arr.count > 0 else { return 0 }
        var maxsum = arr[0]
        var delsum = arr[0]
        var keepsum = arr[0]
        for index in 1 ..< arr.count {
            delsum = max(keepsum, delsum + arr[index])
            keepsum = max(keepsum + arr[index], arr[index])
            maxsum = max(maxsum, max(delsum, keepsum))
        }
        return maxsum
    }
}
