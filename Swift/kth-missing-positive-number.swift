/**
 * https://leetcode.com/problems/kth-missing-positive-number/
 * 
 * 
 */ 
// Date: Wed Jan  6 16:35:45 PST 2021
class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        let list = Set(arr)
        var count = 0
        for x in 1 ... 2001 {
            if list.contains(x) == false {
                count += 1
            }
            if count == k { return x }
        }
        return -1
    }
}