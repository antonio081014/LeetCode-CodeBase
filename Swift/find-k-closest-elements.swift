/**
 * https://leetcode.com/problems/find-k-closest-elements/
 * 
 * 
 */ 
class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        while left < right {
            let mid = left + (right - left) / 2
            if x - arr[mid] > arr[mid + k] - x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return Array(arr[(left)..<(left + k)])
    }
}
